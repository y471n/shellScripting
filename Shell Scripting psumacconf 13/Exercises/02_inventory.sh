#!/bin/bash

# Exercise 2
# This script uses echo & networksetup

# Written by Rusty Myers & Jay Hoff
# 2013-05-01

# This script will inventory a Mac system for the following information. It will output text for
# 	IP Address of Airport, Ethernet, and Ethernet 1

# Add the script name to start output file
echo "Inventory Script"

# Get Network Interface Ethernet Addresses
networksetup -listallhardwareports

# Ethernet IP address (¡May fail on MacPro with 2 NICs!)
echo "Ethernet:"
networksetup -getinfo Ethernet
echo "Ethernet 1:"
networksetup -getinfo "Ethernet 1"
# Airport IP address
echo "Airport:"
networksetup -getinfo Wi-Fi

exit 0