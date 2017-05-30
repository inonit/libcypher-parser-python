# -*- coding: utf-8 -*-

import re
import os

from setuptools import setup, Extension
try:
    from Cython.Build import cythonize
    USE_CYTHON = True
except ImportError:
    USE_CYTHON = False


def get_version(package):
    """
    Return package version as listed in `__version__` in `init.py`.
    """
    init_py = open(os.path.join(package, '__init__.py')).read()
    return re.search("__version__ = ['\"]([^'\"]+)['\"]", init_py).group(1)

extensions = [
    Extension(
        name='libcypher_parser.parser',
        sources=['libcypher_parser/parser.%(ext)s' % {'ext': 'pyx' if USE_CYTHON else 'c'}],
        include_dirs=['/usr/local/include'],
        libraries=['cypher-parser'],
        library_dirs=['/usr/local/lib', '/usr/local/opt/libcypher-parser']
    )
]

setup(
    name='libcypher-parser-python',
    version=get_version('libcypher_parser'),
    description='Python/Cython interface for libcypher-parser',
    long_description='Python/Cython interface for libcypher-parser.',
    author='Rolf Håvard Blindheim',
    author_email='rhblind@gmail.com',
    url='https://github.com/inonit/libcypher-parser-python',
    download_url='https://github.com/inonit/libcypher-parser-python.git',
    license='Apache License 2.0',
    packages=[
        'libcypher_parser',
    ],
    ext_modules=cythonize(extensions, nthreads=os.cpu_count()) if USE_CYTHON else extensions,
    include_package_data=True,
    install_requires=[],
    setup_requires=[
        'cython>=0.25.x',
    ],
    tests_require=[
        'nose',
        'coverage',
    ],
    zip_safe=False,
    test_suite='tests.run_tests.start',
    classifiers=[
        'Operating System :: OS Independent',
        'Development Status :: 4 - Beta',
        'Environment :: Plugins',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Programming Language :: Python :: 3',
        'Topic :: Software Development :: Libraries :: Python Modules',
    ]
)
