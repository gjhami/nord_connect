#!/usr/bin/env bash

# Install openvpn, nordvpn certificates, and unzip
apt-get install openvpn --quiet --assume-yes
apt-get install ca-certificates --quiet --assume-yes
apt-get install unzip --quiet --assume-yes
apt-get install speedtest-cli --quiet --assume-yes

# Trust nordvpn certificate and install configs
cd /etc/openvpn
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
unzip ovpn.zip
rm ovpn.zip
