#!/usr/bin/env python
# encoding: utf-8
import sys


def is_float(s):
    try:
        num = float(s)
        return True
    except ValueError:
        return False


def mapper():
    from_node1 = from_node2 = None
    for line in sys.stdin:
        data = line.strip().split()
        if len(data) == 2 and is_float(data[1]):
            from_node1 = data[0]
            from_node_pr = float(data[1])
        else:
            from_node2 = data[0]
            if from_node1 == from_node2:
                num_to_nodes = len(data) - 1
                for to_node in data[1:]:
                    print "%s %s" % (to_node, from_node_pr / num_to_nodes)


mapper()
