#!/bin/bash
#-----------------------------------------------------------------------------
# NaLUG@UniNA
# 
# Esempi di definizioni e uso variabili in bash
#
#-----------------------------------------------------------------------------


	#Variabili
	X="NaLUG"
	Y="Workshop"
	Z=2019

	#echo ${STRINGA[*]}
	echo -e "\nEcco i valori delle variabili X,Y e Z"	
	echo -e $X" "$Y" "$Z "\n"

	#Differenza tra "" e ''
	X=2019
	Y=" NaLUG $X"
	Z=' NaLUG $X'
	
	echo "Differenza tra stringhe tra doppi apici"
	echo "Y = $Y"
	echo -e "Z = $Z \n"

	
	#Array
	X=("NaLUG" "WORKSHOP" 2019)
	echo "Array"
	echo ${X[*]}

	# $(( )) server per effettuare operazioni aritmentiche 
	XLEN=$(( ${#X[*]}-1 ))
	echo -e "Indici presenti nell'array :\n\t${!X[*]}\n"
	
	for i in $( seq 0 $XLEN ) ;do
		echo -e "X[$i] : ${X[$i]} \n\tLunghezza di X[$i]: ${#X[$i]}\n\n"
	done
