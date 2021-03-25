#!/bin/bash
echo "Nombre del directorio:"
read directorio

echo "Nombre fichero:"
read filename

if [[ ! -d ${directorio} ]]
then
	mkdir ${directorio} && touch ${directorio}/${filename}.txt
else
	echo "Error: el direcorio ${directorio}."
fi

