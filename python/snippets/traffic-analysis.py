#!/usr/bin/python3

from scapy.all import *
 
for pkt in sniff(iface='en0', count=5):
    print('Packet: ' + str(pkt.summary()) + '\n')
