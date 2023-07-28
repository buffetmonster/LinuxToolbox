#to be called via BashFunctions.sh : go_docker_env()
#/bin/bash
export PATH=$PATH:$ST_COMMON_TOOLCHAIN_BASE/bin
echo "toolchain: $ST_COMMON_TOOLCHAIN_BASE"
#echo "ST_COMMON gcc:"
#ls $ST_COMMON_TOOLCHAIN_BASE/bin/armv7-linux-gcc
echo "which armv7-linux-gcc"
which armv7-linux-gcc
/bin/bash