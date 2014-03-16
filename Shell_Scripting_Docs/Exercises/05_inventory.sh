#!/bin/bash

# Exercise 5
# We start to use grep in this script, including -A flag and '$' basic regex EOL marker.

# Written by Rusty Myers & Jay Hoff
# 2013-05-01

# This script will inventory a Mac system for the following information. It will output text.
#	IP Address of Airport, Ethernet, and Ethernet 1
#	Computer Name
#	Memory
#	Model Identifier
#	Processor Type
#	Processor Speed
#	ProductName
#	ProductVersion
#	BuildVersion
#	Get Hard Drive Size, Availiable Space, and Type

# Add the script name to start output file
echo "Inventory Script"

################# NETWORKING #################
# Get Ethernet Address for Ethernet and Airport
networksetup -listallhardwareports | grep -A2 Ethernet$
networksetup -listallhardwareports | grep -A2 Wi-Fi

# Ethernet IP address (¡May fail on MacPro with 2 NICs!)
echo "Ethernet:"
networksetup -getinfo Ethernet
echo "Ethernet 1:"
networksetup -getinfo "Ethernet 1"
# Airport IP address
echo "Airport:"
networksetup -getinfo Wi-Fi

################# NETWORKING #################

################# SYSTEM #################
# Computer Name
systemsetup -getcomputername

# Get System Info:
# 	Memory
# 	Model Identifier
# 	Processor Type
# 	Processor Speed

system_profiler SPHardwareDataType

# Get OS X information
# 	ProductName
# 	ProductVersion
# 	BuildVersion
sw_vers
################# SYSTEM #################

################# HARDDRIVES #################
# Get Hard Drive Size, Availiable Space, and Type
diskutil list
diskutil info disk0
diskutil info disk1
# Fusion Drives!
diskutil cs list
diskutil cs info disk2
################# HARDDRIVES #################

exit 0