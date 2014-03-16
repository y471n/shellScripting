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

exit 0
