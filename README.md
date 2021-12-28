# udpbroadcastrelay docker container

This docker container implements <https://github.com/deonvdw/udpbroadcastrelay> which is a fork of https://github.com/marjohn56/udpbroadcastrelay that adds SSDP/DIAL support. This container was built to fix Chromecast Speaker group visibility from Android and iOS devices on seperate VLANs for UDM/P devices.


## Setup

1. Find and kill any avahi processes as it will block this tool from running because avahi also runs on TCP port 5353
1. Find interfaces for both LAN and IOT(network where cast devices are), usually br0 and brXX (ie br42)
1. Run `podman run -d --network=host --restart=always -e VLAN1="br0" -e VLAN2="br42" --name udpbroadcastrelay stonith/udpbroadcastrelay` (replace the VLAN# env vars with your own)

