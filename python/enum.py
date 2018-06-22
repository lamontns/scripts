#!/usr/bin/python

import os, sys, time
import multiprocessing
from multiprocessing import Process, Queue
import subprocess

def help():
	print "[*] Usage: python portscan.py -s <target-subnet>"
        print "[*] Ex.  : python portscan.py -L /path/to/host-list"
        print ""
        print "Possible Arguments:"
        print "----------------------"
        print " -s      --> Discover and scan target subnet (Ex.  -s 192.168.1.0/24 )"
        print " -L      --> Path to file with list of target-ip addresses"
        print " -h      --> Target host you want to scan (Ex.  -h 192.168.1.1 )"
        print ""
        print "Future Features I Plan to Add:"
        print "-------------------------------"
        print " -> Choose specific scan type or service"
        print " -> Overview output file AND host specific output to folders"
        sys.exit(1)

#def multiproc(rhost, scan, port):
#	jobs = []
#	p = multiprocessing.Process(target=rhost, args=(scan,port))
#	jobs.append(p)
#	p.start()
#	return

def discovery(subnet):
	PINGSCAN = "nmap -sn "+subnet+" | grep -B1 'Host is up' | grep report | cut -d' ' -f5"
	output = subprocess.check_output(PINGSCAN, shell=True)
	print output
	#PARSE = "for x in $("+output+"); do "

def portScan(rhost):
	print '[nmap] Quick Scan - 100 Most Common Ports'
        print '[nmap] Target: ' + rhost
        print '-----------------------------------------'
	s1 = subprocess.Popen(['nmap', '-sT', '--top-ports', '100', '--open', rhost])
	output = s1.communicate()[0]
	print output
	print ''
	print '[nmap] Full TCP Connect Scan - ALL Ports'
        print '[nmap] Target: ' + rhost
        print '-----------------------------------------'
	s2 = subprocess.Popen(['nmap', '-sT', '-T4', '-p-', '--open', rhost])
	output = s2.communicate()[0]
	print output
	print ''


def results():
	print ''
	print '[*] More to come soon!'

def main():
	if len(sys.argv) <= 1:
		help()
		sys.exit(1)

	if sys.argv[1] == '-L':
		print "Didn't quite get to this part yet..."
	
	elif sys.argv[1] == '-s':
		discovery(sys.argv[2])
				
	elif sys.argv[1] == '-t':
		portScan(sys.argv[2])

	else:
		help()
		sys.exit(1)
	

print '========================================================'
print '========= Python Port Scanner and Enumeration =========='
print '--------------------------------------------------------'
print ''
main()
results()
sys.exit(0)
