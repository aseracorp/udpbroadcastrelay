#!/bin/ash
echo `date` "starting udpbroadcastrelay"
echo "Using vlan interfaces:" $VLAN1 $VLAN2
/udpbroadcastrelay --id 1 --port 5353 --dev $VLAN1 --dev $VLAN2 --multicast 224.0.0.251 -s 1.1.1.2
