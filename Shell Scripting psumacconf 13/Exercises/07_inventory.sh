#!/bin/bash

# Exercise 7
# We add a for loop for the diskutil. We set the first echo to overwrite the file with a single redirect. We also use read -p to get a variable SAVETXT and VIEWTXT for test statements. We also use more and clear for viewing the output file.

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

# Add the script name and date to start output file
# Change redirect to overwrite file if it exists
echo "Inventory Script - $(date)" > "$FILEOUTPUT"

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
# Loop through disks 
echo "Disk Information:" >> "$FILEOUTPUT"
for i in {1..4}
do
	echo "Disk$i" >> "$FILEOUTPUT"
	diskutil info "disk$i" >> "$FILEOUTPUT"
done

# Fusion Drives!
diskutil cs list >> "$FILEOUTPUT"
diskutil cs info disk2 >> "$FILEOUTPUT"
################# HARDDRIVES #################

################# VIEWFILE #################
read -p "Would you like to view the output (Y/N)?" VIEWTXT

if [[ $VIEWTXT = "Y" ]]; then
	more "$FILEOUTPUT"
fi
################# VIEWFILE #################

################# SAVEFILE #################
read -p "Would you like to save a copy of this script (Y/N)?" SAVETXT

if [[ $SAVETXT = "Y" ]]; then
	echo "Script Complete" >> "$FILEOUTPUT"
	echo ""$FILEOUTPUT" saved."
	open .
else
	# rm temp file
	rm "$FILEOUTPUT"
	echo "File Removed"
fi
################# SAVEFILE #################

sleep 2
clear

exit 0
