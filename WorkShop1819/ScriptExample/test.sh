#!/bin/bash
i="abc"
j="def"
#[ $j != $i ]
#echo $?

for i in $(seq 0 3); do
	echo $i
done
