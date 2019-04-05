#!/bin/bash

#Verifico che ci sia almeno un parametro in input
if [ $# -ne 1 ]; then
	echo "Uso: ./count.sh perolaDaCercare"
	exit
fi

#salvo il parametro dato in ingresso in una variabile
TEXT=$1
TOT_OCC=0

#salvo la lista dei file,escluso count.sh, in un array
FILES=( $(ls -l| grep -v "*.sh" | awk '{print $9}'))

#per ogni file nella lista conto il numero di occorrenze della parola in input
for i in $(seq 0 $((${#FILES[@]}-1))); do 
	echo "Trovo il testo $TEXT in ${FILES[i]}"
	OCCORRENZE=( $( grep  -w "$TEXT" ${FILES[i]} | wc -l ))i
	
	#salvo il numero totale di occorrenze
	TOT_OCC=$(($TOT_OCC+$OCCORRENZE))

	echo "Nel file ${FILES[i]} la parola $TEXT è stata trovata $OCCORRENZE volte"
	echo 
done

echo "Totale delle occorrenze: $TOT_OCC"
