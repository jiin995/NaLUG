#!/bin/bash

COMMAND='echo "hello world"'

$COMMAND

X=1
Y=3
echo $X+$Y
echo '$(( $X+$Y )) =' $(($X+$Y))   

