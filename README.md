# Cypher parser for Python

[![Build Status](https://travis-ci.org/inonit/libcypher-parser-python.svg?branch=master)](https://travis-ci.org/inonit/libcypher-parser-python)
[![Coverage Status](https://coveralls.io/repos/github/inonit/libcypher-parser-python/badge.svg?branch=master)](https://coveralls.io/github/inonit/libcypher-parser-python?branch=master)

Python interface for [libcypher-parser](https://cleishm.github.io/libcypher-parser/).

## Getting started

Requires `libcypher-parser` to be installed before compiling the extension.

**Debian/Ubuntu**

```
$ sudo add-apt-repository ppa:cleishm/neo4j
$ sudo apt-get update
$ sudo apt-get install libcypher-parser-dev
```

**macOS**

```
$ brew install cleishm/neo4j/libcypher-parser
```

For other platforms, see [the official docs](http://cleishm.github.io/libcypher-parser/#building).

**Installation**

```
$ pip install libcypher-parser-python
```


## To build

```
$ pip install Cython
$ python setup.py build_ext --inplace
```

**A simple test**

Paste the following code in your terminal.

```
$ python -c "from libcypher_parser import parse_statement; print(parse_statement('MATCH (n) RETURN n'))"
(True, {'n_errors': 0, 'n_nodes': 10, 'n_statements': 1})
```


## Build distribution

**macOS**

1. Make sure to install the dev dependencies

```
$ pipenv install -d
```

2. Build both the source and wheel distribution

```
$ python setup.py sdist bdist_wheel
```

3. Add required dynamic libraries to the binary distribution

We'll use the [delocate](https://github.com/matthew-brett/delocate) tool to add required 
dynamic libraries so that users won't have to compile it themselves.

```
$ delocate-listdeps --all dist/libcypher_parser_python-0.0.5-cp37-cp37m-macosx_10_13_x86_64.whl
```

4. Verify that dynamic libraries are included

```
$ delocate-listdeps --all dist/libcypher_parser_python-0.0.5-cp37-cp37m-macosx_10_13_x86_64.whl
/usr/lib/libSystem.B.dylib
/usr/local/Cellar/libcypher-parser/0.6.0/lib/libcypher-parser.8.dylib
```

**Linux**

TODO: Write similar setup for [autitwheel](https://github.com/pypa/auditwheel)

**Windows**

TODO
