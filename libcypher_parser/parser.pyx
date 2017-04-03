# -*- coding: utf-8 -*-

def get_parser_version():
    """
    :returns: The version string for libcypher-parser.
    :rtype: bytes
    """
    cdef const char* version = libcypher_parser_version()
    return <bytes> version

def to_cstring(str s):
    """
    Converts a Python string to a C string.
    :returns: A C compatible string representation of ``s``.
    :rtype: bytes
    """
    cdef bytes b = s.encode()
    cdef char* c_string = b
    return c_string

def parse_statement(str statement, int flags=CYPHER_PARSE_ONLY_STATEMENTS):
    """
    Parse a command or statement from a string.
    All statements and/or client commands are parsed from the input string,
    and a result returned. The result must be passed to cypher_parse_result_free()
    to release dynamically allocated memory. If the flag
    CYPHER_PARSE_ONLY_STATEMENTS is set, client commands will not be parsed.
    
    @:param statement: Command or statement to parse.
    @:param flags: Integer flag to indicate whether or not to parse client commands.
    @:returns: Two-tuple containing a Boolean value indicating if the statement was
               parsed correctly and a dictionary with some statistics. 
    """
    cdef cypher_parse_result* result
    cdef cypher_input_position* input_position = NULL
    cdef cypher_parser_config* config = NULL

    result = cypher_parse(s=to_cstring(statement), last=input_position, config=config, flags=flags)
    if result == NULL:
        return False
    else:
        try:
            n_errors = cypher_parse_result_nerrors(result)
            data = {
                'n_errors': n_errors,
                'n_nodes': cypher_parse_result_nnodes(result),
                'n_statements': cypher_parse_result_ndirectives(result)
            }
        finally:
            # Free memory associated with a parse result.
            cypher_parse_result_free(result)
        return (True, data) if n_errors <= 0 else (False, data)
