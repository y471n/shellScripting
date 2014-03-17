#!/bin/bash

# By: Yatin
# On: 16-03-14

echo "Inventory Script"

# Ethernet
echo "Ethernet: "
networksetup -getinfo Ethernet

# Airport
echo "Airport: "
networksetup -getinfo Wi-Fi

# System Name
echo "System Name: "
systemsetup -getcomputername

# System Info
echo "System Info: "
system_profiler SPHardwareDataType

# Software Version
echo "Software Info: "
sw_vers

# DiskUtil: 
echo "Disk info: "
diskutil info disk0

exit 0
