#!/bin/bash

# Update the package list and install dnsmasq and dhcpcd
sudo apt update
sudo apt install -y dnsmasq dhcpcd5

# Configure dnsmasq to provide DHCP on the eth0 interface
echo "interface=eth0
dhcp-range=192.168.144.10,192.168.144.11,12h" | sudo tee /etc/dnsmasq.conf

# Add static configuration for eth0 at the end of dhcpcd.conf
echo "
interface eth0
static ip_address=192.168.144.10/24
static routers=192.168.144.1
static domain_name_servers=8.8.8.8 8.8.4.4" | sudo tee -a /etc/dhcpcd.conf

# Restart services to apply settings
sudo systemctl restart dnsmasq
sudo systemctl restart dhcpcd

# Enables services to start automatically at boot
sudo systemctl enable dnsmasq
sudo systemctl enable dhcpcd
