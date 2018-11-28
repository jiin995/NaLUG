#!/bin/bash

if [ $# -ne 1 ]; then 
	echo "Uso: ./getPid.sh process name"
	exit
fi

PID=$(  ps axf | grep "chromium" | grep -v "grep" | awk 'NR==1{print $1}')
echo "$PID"

