#!/usr/bin/python3

import sys
import argparse

print('The arguments are')
print(sys.argv)

parser = argparse.ArgumentParser(description='The Achilles HTML Vulnerability Analyzer Version 1.0')
 
parser.add_argument('-v', '--version', action='version', version='%(prog)s 1.0')
 
args = parser.parse_args()
