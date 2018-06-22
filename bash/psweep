#!/bin/bash

# Ping sweep of a network of your choosing

#if $1 == '':
#	echo "[Usage] ./pingsweep <target-network>"
#	echo "[Ex.  ] ./pingsweep 192.168.1"

for ip in $(seq 1 254); do
	#ping -c1 $1.$ip | grep '64 bytes' | cut -d' ' -f4 | cut -d':' -f1 | xargs echo [+] & 
	ping -c1 $1.$ip | grep '64 bytes' | cut -d' ' -f4 | cut -d':' -f1 | sort -u >> hosts &

done
for x in $(cat hosts); do
	host -l $x | cut -d' ' -f5 | xargs echo $x - | sort -u 2>/dev/null
done
rm hosts
