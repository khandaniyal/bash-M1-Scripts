#!/bin/bash

echo "Escribe la ruta de un directorio existente" 
read directory

if [[ -d "$directory" && -r "$directory" ]]
then 
	echo "Tienes permisos para acceder a esta carpeta existente" && ls -l $directory
else
	echo "Ruta no existe o no tienes permiso de lectura en este directorio."
fi


