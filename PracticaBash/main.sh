#!/bin/bash

. funcions2.sh
. funcions1.sh


echo ""
# Main 
echo "-----------------------------------------------------------------"
echo "--    Benvingut al programa d’inicialització"
echo "--    $USER "
echo "--    13/01/2020"

while true; 

do

echo "-----------------------------------------------------------------"
echo "--    Menú d’opcions:"
echo "--    1. Gestió d’usuaris i grups"
echo "--    2. Gestió de directoris i fitxers"
echo "--    3. Gestió de programari"
echo "--    4. Sortir"
echo "-----------------------------------------------------------------"

read -p "Escull una opció: " op

case $op in

        1) . op1.sh;;
        2) . op2.sh;;
        3) echo "Opció no disponible";;
        4) despedidaEpica;;
        *) echo "Opció no válida.";;

esac

if [[ "$op" == 4 ]]; then
        break
fi

done
