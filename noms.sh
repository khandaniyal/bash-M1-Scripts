#!/bin/bash

read -p "Dime un nombre: " nom
nomEncontrado=""
declare -a array=("Dani" "Diego" "Sergi" "Eric" "Kilian" "Victor" "Frank")

for i in $array[@];
do
	if [[ "$nom" != "$i" ]]; then

		echo "Nombre no encontrado: $nom"
	else
		nomEncontrado=$i 
		echo "hi"
	fi
done

