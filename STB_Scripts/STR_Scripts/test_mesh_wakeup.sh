#!/bin/bash

# Call the command
/usr/bin/meshstr MESH_WAKEUP

# Wait for 20 seconds
sleep 20

# List loaded kernel modules
lsmod

# Creating route to gw
sleep 2
echo "Creating route to gw..."
ping www.google.com -c3

# Checking ping
sleep 2
echo "Checking ping"
ping www.google.com -c3