#!/bin/bash

echo "==== System Monitoring Report ===="
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)"

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Disk Usage:"
df -h /

exit 0