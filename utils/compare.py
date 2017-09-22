from __future__ import print_function
import os
import sys

def main():
    # print command line arguments
    if len(sys.argv[1:]) != 2:
        sys.exit(0)
    test_file = sys.argv[1]
    check_file = sys.argv[2]
    print(test_file, check_file)

if __name__ == "__main__":
    main()
