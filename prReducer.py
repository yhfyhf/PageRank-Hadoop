#!/usr/bin/env python
# encoding: utf-8
import sys
from config import N, alpha


def reducer():
    pre_node = node = None
    sum = 0
    for line in sys.stdin:
        data = line.strip().split()
        node, contribute = data[0], float(data[1])
        if node == pre_node:
            sum += alpha * contribute
            pre_node = node
        else:
            if pre_node:
                print "%s %s" % (pre_node, sum)
            sum = (1 - alpha) / N + alpha * contribute
            pre_node = node
    if pre_node:  # the last line
        print "%s %s" % (pre_node, sum)

reducer()
