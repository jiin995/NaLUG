#!/bin/bash
#-----------------------------------------------------------------------------
# NaLUG@UniNA
# 
# Restituisce l'indirizzo ip di un interfaccia di rete
#
#-----------------------------------------------------------------------------

usage(){
cat <<EOF
		Uso :\n\t./getIp.sh INTERFACE
		Esempio :\n\t./getIp.sh etho
EOF
}

#Verifico che ci siano esattamente due parametri in input
if [ $# -eq 1 ]; then
	INTERFACE=$1
	IP=$(sudo ifconfig $INTERFACE | grep "inet " | awk '{print $2}')
	echo “L’ip dell’interfaccia $INTERFACE è $IP”
elif [ $# == 0 ]; then
	usage
	exit
fi

