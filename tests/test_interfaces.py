# -*- coding: utf-8 -*-

from unittest import TestCase
from libcypher_parser import parser


class TestParserInterface(TestCase):

    def test_get_version(self):
        self.assertIsInstance(parser.get_parser_version(), bytes)

    def test_to_cstring(self):
        self.assertIsInstance(parser.to_cstring('Hello, world!'), bytes)

    def test_parse_statement_is_valid(self):
        is_valid, data = parser.parse_statement('MATCH (n) RETURN n')
        self.assertTrue(is_valid)
        self.assertDictEqual(data, {
            'n_errors': 0,
            'n_nodes': 10,
            'n_statements': 1
        })
