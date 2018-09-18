#!/bin/bash

if [ -z "$1" ]; then
	echo
	echo "================================="
	echo ">> SNMP Network Mapping Script <<"
	echo "================================="
	echo
	echo "Usage: $0 <target-ip>"
	echo
	echo "** Scans the full subnet of the target IP."
	echo
	echo "Ex. $0 192.168.4.20 -- would scan 192.168.4.0/24"
	echo
	exit 0
fi

if [ ! type nmap &> /dev/null ]; then
	echo
	echo "[*] Nmap is required to use this script."
	echo "[*] Please install it and try again."
	echo
	exit 0
fi

if [ ! -f community ]; then
	echo
	echo "SNMP community list not found in the current directory."
	echo -n "Would you like to create it? (Y/n): "
	read resp
	if [ "$resp" == "n" ] || [ "$resp" == "N" ]; then
		exit 0
	else
		touch community
		echo "public" >> community
		echo "private" >> community
		echo "manager" >> community
	fi
fi

echo
echo "================================================"
echo ">> Starting SNMP Scan of Subnet: $1"
echo 
nmap -sU -p161 --open $1/24 | grep 'report for' | awk '{print $5}' >> hosts.txt
echo 
echo "[+] Host List Sucessfully Created."
echo ">> Starting SNMP Community Scan on Discovered Hosts..."
echo 
onesixtyone -c community -i hosts.txt

