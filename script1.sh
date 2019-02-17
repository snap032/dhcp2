#!/bin/bash

sudo apt-get update
sudo apt-get -y install isc-dhcp-server
apt-get install git -y
rm -rf /etc/dhcp/dhcpd.conf
git clone https://github.com/snap032/dhcp.git
mv dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf
sed -i 's/INTERFACES=""/INTERFACES="enp0s8"/' /etc/default/isc-dhcp-server
sudo tee -a /etc/network/interfaces << EOF
auto enp0s8
iface enp0s8 inet static
address 172.16.6.2
netmask 255.255.255.0
EOF

service isc-dhcp-server restart

