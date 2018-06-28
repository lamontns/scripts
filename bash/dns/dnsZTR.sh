#!/bin/bash
#
# DNS Zone Transfer

if [ -z "$1" ]; then
	echo
	echo "======================================"
	echo "---->> DNS Zone Transfer Script <<----"
	echo "======================================"
	echo
	echo "[*] Usage: $0 <domain>"
	echo "[*] Ex.  : $0 example.com"
	echo
	exit 0
fi

# Identify DNS servers for the domain and
# attempt a zone transfer from each.
for z in $(host -t ns $1 | cut -d' ' -f4); do
	host -l $1 $z | grep 'has address'
done
