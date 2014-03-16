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

exit 0
