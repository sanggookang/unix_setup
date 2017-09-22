from __future__ import print_function
import os
import sys
import argparse

def contains(ARGS):
    test = ARGS.test[0]
    check = ARGS.check[0]
    fragmented = ARGS.frag
    if not os.path.isfile(test) or not os.path.isfile(check):
        print('false')
        sys.exit(0)
    with open(check, 'r') as f:
        check = f.read()
    with open(test, 'r') as f:
        if fragmented:
            test = f.read().split('\n')
        else:
            test = [f.read()]
    for line in test:
        if line not in check:
            print('false')
            sys.exit(0)
    print('true')
    sys.exit(0)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='check if a file exists in another file')
    parser.add_argument('test', metavar='Test', nargs=1, type=str,
                        help='file with contents to look for')
    parser.add_argument('check', metavar='Check', nargs=1, type=str,
                        help='file to search contents in')
    parser.add_argument('--frag', dest='frag', action='store_true', default=False, help="Search each line individually")
    parser.set_defaults(func=contains)

    ARGS = parser.parse_args()
    if ARGS.func is None:
        parser.print_help()
        sys.exit(1)
    else:
        ARGS.func(ARGS)
