#!/bin/bash

# Exercise 3
# This script adds system_profiler & systemsetup


# Written by Rusty Myers & Jay Hoff
# 2013-05-01

# This script will inventory a Mac system for the following information. It will output text.
# 	IP Address of Airport, Ethernet, and Ethernet 1
#	Computer Name
# 	Memory
# 	Model Identifier
# 	Processor Type
# 	Processor Speed

# Add the script name to start output file
echo "Inventory Script"

# Get Network Interface Ethernet Addresses
networksetup -listallhardwareports

# Ethernet IP address (¡May fail on MacPro with 2 NICs!)
#ipconfig getifaddr en0
echo "Ethernet:"
networksetup -getinfo Ethernet
echo "Ethernet 1:"
networksetup -getinfo "Ethernet 1"
# Airport IP address
#ipconfig getifaddr en1
echo "Airport:"
networksetup -getinfo Wi-Fi

# Computer Name
systemsetup -getcomputername

# Get System Info:
# 	Memory
# 	Model Identifier
# 	Processor Type
# 	Processor Speed
system_profiler SPHardwareDataType

exit 0

