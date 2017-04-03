# -*- coding: utf-8 -*-
"""
This file contains Cython interfaces for libcypher-parser
(https://github.com/cleishm/libcypher-parser).
"""

cdef extern from 'cypher-parser.h':
    # If set, client commands will not be parsed
    int CYPHER_PARSE_ONLY_STATEMENTS

    # A parse result
    struct cypher_parse_result:
        pass

    # A parse error
    struct cypher_parse_error:
        pass

    # Configuration for a cypher parser
    struct cypher_parser_config:
        pass

    # A position in the input
    struct cypher_input_position:
        int line
        int column
        size_t offset

    #
    # Function calls
    #

    # The version string for libcypher-parser.
    const char* libcypher_parser_version()

    # Free memory associated with a parse result.
    # The result will no longer be valid after this function is invoked
    void cypher_parse_result_free(cypher_parse_result* result)

    # Parse a command or statement from a string.
    # All statements and/or client commands are parsed from the input string,
    # and a result returned. The result must be passed to cypher_parse_result_free()
    # to release dynamically allocated memory. If the flag
    # CYPHER_PARSE_ONLY_STATEMENTS is set, client commands will not be parsed.
    cypher_parse_result* cypher_parse(const char* s, cypher_input_position* last, cypher_parser_config* config, int flags)

    # Get the total number of AST nodes parsed.
    # Includes all children, at any depth, of all result elements.
    unsigned int cypher_parse_result_nnodes(const cypher_parse_result* result)

    # Get the number of statements or commands parsed.
    unsigned int cypher_parse_result_ndirectives(const cypher_parse_result* result)

    # Get the number of errors encountered during parsing.
    unsigned int cypher_parse_result_nerrors(const cypher_parse_result* result)
