#!/usr/bin/python

import os
import sys
import socket
import subprocess

def scan(rhost):
	print '[nmap] Quick Scan - Top 20 Ports'
        print '[nmap] Target: ' + rhost
        print '-----------------------------------------'
	s1 = subprocess.Popen(['nmap', '-sV', '--top-ports', '20', '--open', rhost])
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


def multiscan(rhosts):
	print '[nmap] Quick Scan - Top 20 Ports'
	print '[nmap] Targets: ' + rhosts
	print '-----------------------------------------'
	s1 = subprocess.Popen(['nmap', '-sV', '--top-ports', '20', '--open', '-iL', rhosts])
	output = s1.communicate()[0]
	print output
	print ''
	print '[nmap] Full TCP Connect Scan - ALL Ports'
	print '[nmap] Targets: ' + rhosts
	print '-----------------------------------------'
	s2 = subprocess.Popen(['nmap', '-sT', '-T4', '-p-', '--open', '-iL', rhosts])
        output = s2.communicate()[0]
        print output
	print ''


def results():
	print ''
	print '[*] More to come soon!'

def main():
	if sys.argv < 1:
		print "[*] Usage: python portscan.py <target-ip>"
		print "[*] OR	: python portscan.py -L /path/to/host-list"
		print "[*] Ex.	: python portscan.py -L /opt/recon/hosts"
		sys.exit(1)

	if sys.argv[1] == '-L':
		multiscan(sys.argv[2])
	
	else:
		scan(sys.argv[1])
	

print '========================================================'
print '========= Python Port Scanner and Enumeration =========='
print '--------------------------------------------------------'
print ''
main()
results()
sys.exit(0)
