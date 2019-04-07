#!/bin/bash
#-----------------------------------------------------------------------------
# NaLUG@UniNA
# 
# Conta il numero di occorrenze di una parola nei file .txt di una cartella
#
#-----------------------------------------------------------------------------

#Verifico che ci siano esattamente due parametri in input
if [ $# -ne 2 ]; then
	echo -e "Uso :\n\t./count.sh WORD PATH"
	echo -e "Esempio :\n\t./count.sh 123456 DataSets"
	exit
fi

#salvo il parametro dato in ingresso in una variabile
WORD=$1
MYPATH=$2
TOT_OCC=0

#salvo la lista dei file che in $PATH hanno estensione txt in un array
FILES=( $(ls -l $MYPATH | grep "txt" | awk '{print $9}'))

#per ogni file nella lista conto il numero di occorrenze della parola in input
for i in $(seq 0 $((${#FILES[@]}-1))); do

	echo "Trovo il testo $WORD in $MYPATH/${FILES[i]}"

	#Cerco all'interno del file il testo e ne conto il numero di occorrenze
	OCCORRENZE=( $( grep  -w "$WORD" $MYPATH/${FILES[i]} | wc -l ))
	
	#Aggiorno il numero totale di occorrenze
	TOT_OCC=$(($TOT_OCC+$OCCORRENZE))

	echo "Nel file ${FILES[i]} la parola $TEXT è stata trovata $OCCORRENZE volte"
	echo 
done

echo "Totale delle occorrenze: $TOT_OCC"
