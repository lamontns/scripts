#!/bin/bash

echo ''
echo '>> Current Network Status:'
echo '============================'
echo ''
ifconfig | grep 'inet ' | grep -v '127.' | sed 's/inet/IP:/'

echo ''
echo ''
echo '[*] Starting ARP Scan of Local Subnet...'
echo '=========================================='
echo ''
arp-scan --localnet

echo ''
echo ''
echo '[*] Starting Ping Sweep of Local Subnet...'
echo '============================================'
echo ''
nmap -sn $(ifconfig | grep 'inet ' | grep -v '127.' | awk '{print $2}')/24 | grep 'report for' | awk '{print "[+] " $5}'

echo ''
echo ''
echo '[*] Starting Quick Port Scan on Discovered IPs...'
echo '=================================================='
for x in $(nmap -sn $(ifconfig | grep 'inet ' | grep -v '127.' | awk '{print $2}')/24 | grep 'report for' | awk '{print $5}'); do
	echo ''
	echo '[#] Host: '$x
	echo 'PORT   STATE SERVICE'
	echo '--------------------'
	nmap -sT -T4 --open --top-ports 20 $x | grep 'tcp open'
	done

echo ''
echo ''
echo '[*] Attempting DNS Enumeration on Discovered Hosts...'
echo '======================================================'
for x in $(nmap -sn $(ifconfig | grep 'inet ' | grep -v '127.' | awk '{print $2}')/24 | grep 'report for' | awk '{print $5}'); do
	dig axfr @$x $1
	done

echo ''
echo '________________________________________'
echo ' *** For more accurate DNS Results  *** '
echo ' *** enter domain-name as the first *** '
echo ' *** argument of the script.	  *** '
echo '*************************************** '
echo ' Ex.  ./chnet.sh example.com'
echo ''
