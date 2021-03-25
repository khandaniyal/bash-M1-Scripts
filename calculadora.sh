#!/bin/bash

echo "Entra dos valores: "
read num1
read num2

echo "Escoge que operación quieres hacer: "
echo "1: Sumar"
echo "2: Restar"
echo "3: Multiplicar"
echo "4: Dividir"
read op

if [[ $op -eq 4 && $num2 -eq 0 ]]
then
	echo "No se puede dividir entre 0"
else


	case $op in
		1)resultado=`echo $num1 + $num2 | bc`;;
		2)resultado=`echo $num1 - $num2 | bc`;;
		3)resultado=`echo $num1 \* $num2 | bc`;;
        	4)resultado=`echo "scale=2; $num1 / $num2" | bc`;;
	esac
	echo "El resultado es: $resultado"
fi

