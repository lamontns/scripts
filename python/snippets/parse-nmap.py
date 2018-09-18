#!/usr/bin/python

import csv
import sys

fname = sys.argv[1]

# suffix added to files created
suffix = '-nmap.csv'
cols = ['PORT', 'STATE', 'SERVICE', 'VERSION']

def getIP(line):
	if not line:
		return None
	if 'Nmap scan report for' in line:
		return line[21:-1]
	return ''

def findHead(line):
	if not line:
		return False
	for i in cols:
		if i not in line:
			return False
	return True

def parseData(line):
	data = []
	for i in line.split():
		if i.isspace():
			continue
		if len(data) == 0:
			for j in i.strip().split('/'):
				data.append(j)
		else:
			data.append(i.strip())

	i = 4
	version = ''
	while i < len(data):
		version += ' ' + data[i]
		data.remove(data[i])
	if version:
		data.append(version.strip())
	return data

def checkLine(line):
	for i in line:
		if i.isdigit():
			continue
		if i == '/':
			return True
		return False

# Start Main Script
with open(fname, 'r') as fin:
	while True:
		while True:
			ip = getIP(fin.readline())
			if ip != '':
				break
			if ip == None:
				break
			while not findHead(fin.readline()):
				pass

			data = []
			while True:
				line = fin.readline()
				if line[0] == '|':
					continue
				if not checkLine(line):
					break
				data.append(parseData(line))

			with open(ip + suffix, 'wb') as csvfile:
				rows = csv.writer(csvfile)
				cols.insert(1, 'PROTOCOL')
				rows.writerow(cols)
				cols.remove('PROTOCOL')
				rows.writerows(data)
