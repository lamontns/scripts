#!/usr/bin/python

import os
import sys
import subprocess

target = sys.argv[1]

p = subprocess.Popen(['ping', '-c 4', target])
output = p.communicate()[0]
print output
