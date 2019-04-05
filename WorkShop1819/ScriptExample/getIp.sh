#!/bin/bash

if [ $# -eq 1 ]; then
	INTERFACE=$1
	IP=$(sudo ifconfig $INTERFACE | grep "inet " | awk '{print $2}')
	echo “L’ip dell’interfaccia $INTERFACE è $IP”
elif [ $# == 0 ]; then
	echo "dammi un input"
fi

