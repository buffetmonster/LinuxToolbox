#!/bin/bash

echo "Checking ping"
ping www.google.com -c3

sleep 2
# Call the command
/usr/bin/meshstr MESH_STANDBY

# Wait for 20 seconds
sleep 20

# List loaded kernel modules
lsmod
