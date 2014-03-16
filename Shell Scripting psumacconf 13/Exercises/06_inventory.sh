#!/bin/bash

# Exercise 6
# This script uses the redirect variable FILEOUTPUT for std out into a temp file, grep and escaping characthers for () inside double quotes. We add a serial number variable for the temp file name. 

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

# Serial Number 
SERIALNUMBER=$(system_profiler SPHardwareDataType | grep "Serial Number"| tr -d "Serial Number (system): ")
# Temp File Name
TEMPFILE="$(whoami)-$SERIALNUMBER.txt"
# File Output Path 
FILEOUTPUT="./$TEMPFILE"

# Add the script name to start output file
echo "Inventory Script" >> "$FILEOUTPUT"

################# NETWORKING #################
# Get Ethernet Address for Ethernet and Airport
networksetup -listallhardwareports | grep -A2 Ethernet$ >> "$FILEOUTPUT"
networksetup -listallhardwareports | grep -A2 Wi-Fi >> "$FILEOUTPUT"

# Ethernet IP address (¡May fail on MacPro with 2 NICs!)
echo "Ethernet:" >> "$FILEOUTPUT"
networksetup -getinfo Ethernet >> "$FILEOUTPUT"
echo "Ethernet 1:" >> "$FILEOUTPUT"
networksetup -getinfo "Ethernet 1" >> "$FILEOUTPUT"
# Airport IP address
echo "Airport:" >> "$FILEOUTPUT"
networksetup -getinfo Wi-Fi >> "$FILEOUTPUT"

################# NETWORKING #################

################# SYSTEM #################
# Computer Name
systemsetup -getcomputername >> "$FILEOUTPUT"

# Get System Info:
# 	Memory
system_profiler SPHardwareDataType | grep "Memory:" >> "$FILEOUTPUT"
# 	Model Identifier
system_profiler SPHardwareDataType | grep "Model Identifier:" >> "$FILEOUTPUT"
# 	Processor Type
system_profiler SPHardwareDataType | grep "Processor Name:" >> "$FILEOUTPUT"
# 	Processor Speed
system_profiler SPHardwareDataType | grep "Processor Speed:" >> "$FILEOUTPUT"

# Get OS X information
# 	ProductName
# 	ProductVersion
# 	BuildVersion
sw_vers >> "$FILEOUTPUT"
################# SYSTEM #################

################# HARDDRIVES #################
# Get Hard Drive Size, Availiable Space, and Type
diskutil list >> "$FILEOUTPUT"
diskutil info disk0 >> "$FILEOUTPUT"
diskutil info disk1 >> "$FILEOUTPUT"
# Fusion Drives!
diskutil cs list >> "$FILEOUTPUT"
diskutil cs info disk2 >> "$FILEOUTPUT"
################# HARDDRIVES #################

# Get System Info:
#system_profiler SPHardwareDataType

# Get OS X information
# 	ProductName
# 	ProductVersion
# 	BuildVersion
sw_vers >> "$FILEOUTPUT"

# Get Hard Drive Size, Availiable Space, and Type
diskutil list >> "$FILEOUTPUT"

diskutil info disk0 >> "$FILEOUTPUT"
diskutil info disk1 >> "$FILEOUTPUT"
diskutil info disk2 >> "$FILEOUTPUT"

# Fusion Drives!
diskutil cs list >> "$FILEOUTPUT"
diskutil cs info disk2 >> "$FILEOUTPUT"

exit 0

