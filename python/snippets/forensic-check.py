#!/usr/bin/python3

import hashlib
 
file1 = open('oldfile.txt','r').read().strip().strip('-').encode('utf-8')
file2 = open('newfile.txt','r').read().strip().strip('-').encode('utf-8')
 
hash1 = hashlib.md5(file1).hexdigest()
hash2 = hashlib.md5(file2).hexdigest()
 
if(hash1 == hash2):
  print('Duplicate file found!')
else:
  print('The file is not a match')
