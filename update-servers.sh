#!/bin/bash

SERVER_BASE="/etc/openvpn/ovpn_tcp"
SERVER_LIST=($(ls "${SERVER_BASE}"))
DESTINATION_DIRECTORY="/home/you/code/ratings-boost/nord_connect/nord_tcp"

rm -rf "${DESTINATION_DIRECTORY}"
mkdir -p "${DESTINATION_DIRECTORY}"
for SERVER_FILE in "${SERVER_LIST[@]}"; do
	cat "${SERVER_BASE}/${SERVER_FILE}" | /home/you/code/ratings-boost/nord_connect/append-credentials.gawk > "${DESTINATION_DIRECTORY}/${SERVER_FILE}"
done

SERVER_BASE="/etc/openvpn/ovpn_udp"
SERVER_LIST=($(ls "${SERVER_BASE}"))
DESTINATION_DIRECTORY="/home/you/code/ratings-boost/nord_connect/nord_udp"
rm -rf "${DESTINATION_DIRECTORY}"
mkdir -p "${DESTINATION_DIRECTORY}"

for SERVER_FILE in "${SERVER_LIST[@]}"; do
	cat "${SERVER_BASE}/${SERVER_FILE}" | /home/you/code/ratings-boost/nord_connect/append-credentials.gawk > "${DESTINATION_DIRECTORY}/${SERVER_FILE}"
done
