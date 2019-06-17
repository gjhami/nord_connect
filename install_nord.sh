#!/usr/bin/env bash

# Install openvpn, nordvpn certificates, and unzip
apt-get install openvpn --quiet --assume-yes
apt-get install ca-certificates --quiet --assume-yes
apt-get install unzip --quiet --assume-yes
apt-get install speedtest-cli --quiet --assume-yes

# Trust nordvpn certificate and install configs
rm -rf /etc/openvpn/*
cd /etc/openvpn
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
unzip ovpn.zip
rm ovpn.zip

# Function to update server files to include credentials
update-server-files() {
  PROTOCOL="${1}"
  SERVER_BASE="/etc/openvpn/ovpn_${PROTOCOL}"
  SERVER_LIST=($(ls "${SERVER_BASE}"))
  DEST_DIRECTORY="/home/you/code/ratings-boost/nord_connect/nord_${PROTOCOL}"

  rm -rf "${DEST_DIRECTORY}"
  mkdir -p "${DEST_DIRECTORY}"
  for SERVER_FILE in "${SERVER_LIST[@]}"; do
  	cat "${SERVER_BASE}/${SERVER_FILE}" | \
        /home/you/code/ratings-boost/nord_connect/append-credentials.gawk > \
        "${DEST_DIRECTORY}/${SERVER_FILE}"
  done
}

# Create new server files that use stored credentials
update-server-files "tcp"
update-server-files "udp"
