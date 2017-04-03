# Cypher parser for Python

Python interface for [libcypher-parser](https://cleishm.github.io/libcypher-parser/).

## Getting started

Requires `libcypher-parser` to be installed before compiling the extension.

```
$ brew install cleishm/neo4j/libcypher-parser
```

## To build

```
$ python setup.py build_ext --inplace
```

**A simple test**

Paste the following code in your terminal.

```
$ python -c "from libcypher_parser import parser; print(parser.parse_statement('MATCH (n) RETURN n'))"
(True, {'n_errors': 0, 'n_nodes': 10, 'n_statements': 1})
```

