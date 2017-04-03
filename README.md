# Cypher parser for Python

Python interface for [libcypher-parser](https://cleishm.github.io/libcypher-parser/).

## Getting started

Requires `libcypher-parser` to be installed before compiling the extension.

**Debian/Ubuntu**

```
$ sudo add-apt-repository ppa:cleishm/neo4j
$ sudo apt-get update
$ sudo apt-get install cypher-lint libcypher-parser-dev
```

**macOS**

```
$ brew install cleishm/neo4j/libcypher-parser
```

For other platforms, see [the official docs](http://cleishm.github.io/libcypher-parser/#building).

## To build

```
$ python setup.py build_ext --inplace
```

**A simple test**

Paste the following code in your terminal.

```
$ python -c "from libcypher_parser import parse_statement; print(parse_statement('MATCH (n) RETURN n'))"
(True, {'n_errors': 0, 'n_nodes': 10, 'n_statements': 1})
```

