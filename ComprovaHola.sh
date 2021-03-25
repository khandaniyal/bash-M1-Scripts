#!/bin/sh
str1="hola"
str2="Hola"

echo "Entra palabra"
read palabra

if [[ ${palabra} == "$str1" || ${palabra} == "$str2" ]]
then
	echo "Comprobado."
else
	echo "No es la palabra correcta."
fi
