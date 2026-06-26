#!/bin/bash
echo " HOME $(df -B1G --output=avail /home | tail -n1 | awk '{print $1}') GB "
