#!/bin/bash

# Call the command
mountMeshData

# Wait for 20 seconds
sleep 5
/etc/mesh/mesh_start.sh
# List loaded kernel modules
dmesg -n 7
echo Y > /sys/module/printk/parameters/ignore_loglevel
echo N > /sys/module/printk/parameters/console_suspend

# Creating route to gw
sleep 5
udhcpc -i br0
# Checking ping
sleep 5
echo "Checking ping"
ping www.google.com -c3