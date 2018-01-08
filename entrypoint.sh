#!/bin/sh

echo "Updating Dante Config"
#sed -i '/acl localnet src 172.16.0.0\/12/s/^#//g' /etc/squid/squid.conf
#sed -i '/http_access allow localnet/s/^#//g' /etc/squid/squid.conf
#
## support 8443
#sed -i '/443/a acl SSL_ports port 8443' /etc/squid/squid.conf

services dante-server start && \
echo "${PASSWORD}" | openconnect ${OPTIONS} ${SERVER} && \
echo "Success"

while true; do sleep 1000; done
