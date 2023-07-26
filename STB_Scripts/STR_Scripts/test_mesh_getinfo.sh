#!/bin/bash

# Call the command
echo "Get MW Info:"
cat /NDS/config/version.cfg
echo -e "\\n"
# Wait for 20 seconds
echo "Get Mesh Info:"
cat /etc/buildtime
cat /etc/buildversion
echo -e "\\n"

#Get cdi verion
echo "CDI Version:"
cat /etc/sky_cdi_driver_version.txt
echo -e "\\n"

#Get Driver Versions:
echo "Driver Version"
cat /etc/sky_driver_revision.txt
echo -e "\\n"

# List loaded kernel modules
echo "Get Kernel Version"
if [ -f "/VERSION.gz" ];then
echo "unpack VERSION.gz"
gunzip VERSION.gz -d
fi
if [ -f "/VERSION" ];then
echo "VERSION:"
head -n 18 /VERSION
fi