from __future__ import print_function
import os
import sys

def contains(test, check, fragmented):
    if not os.path.isfile(test) or not os.path.isfile(check):
        return False
    with open(check, 'r') as f:
        check = f.read()
    with open(test, 'r') as f:
        if fragmented:
            test = f.read().split('#')
        else:
            test = [f.read()]
    for line in test:
        if line not in check:
            return False
    return True

def append(addition, source):
    if not os.path.isfile(addition) or not os.path.isfile(source):
        return False
    with open(source, 'a') as s:
        with open(addition, 'r') as a:
            addition = a.read()
            s.write(addition)
