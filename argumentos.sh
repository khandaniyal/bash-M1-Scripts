#!/bin/bash

echo "Avaluación del alumno: $1"

echo "Notas obtenidas: $2 $3 $4"

media=$((($2 + $3 + $4)/3))
print=$(printf '%0.2f' "$media")

echo "Media: $print"

max=$2
low=$2

for arg in "$@"
do
	if [[ "$arg" -gt "$max" ]]
	then
		max=$arg
		
	else
		low=$arg
	fi	
done

echo "Nota más alta: $max"

echo "Nota más baja: $low"
