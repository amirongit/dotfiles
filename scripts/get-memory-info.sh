#!/bin/bash
echo " MEM $(free -g | grep Mem | awk '{print $7}') GB "
