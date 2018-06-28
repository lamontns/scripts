#!/bin/bash

if [ -z "$1" ]; then
	echo
	echo "==========================="
	echo ">> Network Recon Scanner <<"
	echo "---------------------------"
	echo "Usage:"
	echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
	echo "--auto			-> Finds and Enumerates targets"
	echo "-t <targets.txt>	-> Enumerate with List of Targets"
	echo
	exit 0
fi

if [ "$1" == "--auto" ]; then
	echo "Example:  192.168.1.0/24"
	echo -n "Enter the Target Subnet: "
	read resp
	nmap -sn --open $resp | grep 'report for' | awk '{print $5}' >> hosts.txt
fi

echo "==========================================="
echo "[*] Scanning For Accessible Web Servers..."
echo "-------------------------------------------"
for x in $(cat hosts.txt); do
	nmap -sT -p80,443 --open $x | grep 'report for' | awk '{print "[+] " $5}'
done
echo

echo "==========================================="
echo "[*] Scanning For SMTP Servers..."
echo "-------------------------------------------"
for x in $(cat hosts.txt); do
        nmap -sT -p25 --open $x | grep 'report for' | awk '{print "[+] " $5}'
done
echo

echo "==========================================="
echo "[*] Scanning For SMB and Samba Services..."
echo "-------------------------------------------"
for x in $(cat hosts.txt); do
        nmap -sT -p139,445 --open $x | grep 'report for' | awk '{print "[+] " $5}'
done
echo

echo "==========================================="
echo "[*] Scanning For Telnet..."
echo "-------------------------------------------"
for x in $(cat hosts.txt); do
        nmap -sT -p139,445 --open $x | grep 'report for' | awk '{print "[+] " $5}'
done
echo

echo "==========================================="
echo "[*] Scanning For SSH..."
echo "-------------------------------------------"
for x in $(cat hosts.txt); do
        nmap -sT -p139,445 --open $x | grep 'report for' | awk '{print "[+] " $5}'
done
echo

echo "==========================================="
echo "[*] Scanning For Accessible FTP Servers..."
echo "-------------------------------------------"
for x in $(cat hosts.txt); do
        nmap -sT -p21 --open $x | grep 'report for' | awk '{print "[+] " $5}'
done
echo
