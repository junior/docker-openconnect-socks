#!/bin/bash

echo "Updating Squid Config"
sed -i '/acl localnet src 172.16.0.0\/12/s/^#//g' /etc/squid/squid.conf
sed -i '/http_access allow localnet/s/^#//g' /etc/squid/squid.conf

# support 8443
sed -i '/443/a acl SSL_ports port 8443' /etc/squid/squid.conf

echo "${PASSWORD}" | openconnect ${OPTIONS} ${SERVER} && \
service squid start && \
echo "Success"

while true; do sleep 1000; done