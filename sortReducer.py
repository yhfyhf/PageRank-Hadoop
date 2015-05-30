#!/usr/bin/env python
# encoding: utf-8
import sys


def reducer():
    for line in sys.stdin:
        print line.strip()

reducer()
