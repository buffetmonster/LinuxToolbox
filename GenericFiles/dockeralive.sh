#!/bin/bash

count=0
while true; do
  date > /workspace/DockerAliveDate.txt
  ((count++))
  sleep 60
done