#!/bin/bash
#-----------------------------------------------------------------------------
# NaLUG@UniNA
# 
# Restituisce il pid di un processo
#
#-----------------------------------------------------------------------------


usage(){
cat <<EOF
		Uso :\n\t./getPid.sh processName
		Esempio :\n\t./getPid.sh bash
EOF
}

if [ $# -ne 1 ]; then 
	usage
	exit
fi

PROCESS=$1

PID=$(  ps axf | grep "$PROCESS" | grep -v "grep" | awk 'NR==1{print $1}')
echo "$PID"

