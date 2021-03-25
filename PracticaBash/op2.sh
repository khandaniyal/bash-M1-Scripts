#!/bin/bash

. funcions2.sh

while :

do

echo "Opció 2. Gestió de directoris i fitxers"
echo "1. Crear un fitxer"
echo "2. Llegir un fitxer"
echo "3. Eliminar un fitxer"
echo "4. Canviar permisos d’un fitxer"
echo "5. Assignar usuari propietari a un fitxer / directori"
echo "6. Assignar grup propietari a un fitxer"
echo "7. Veure la màscara"
echo "8. Assignar una nova màscara"
echo "9. Crear un directori"
echo "10. Moure un directori"
echo "11. Eliminar un directori"
echo "12. Veure detall d'un directori"
echo "13. Tornar"
echo ""
read -p "Escull una opció " op
echo ""

case $op in
	1) crearFitxer ;;
	2) llegirFitxer ;;
	3) eliminarFitxer ;;
	4) canviarPermisos ;;
	5) assignarUsuariPropietari ;;
	6) assignarGrupPropietari ;;
	7) veureMascara ;;
	8) assignarMascara ;;
	9) crearDirectori ;;
	10) moureDirectori ;;
	11) eliminarDirectori ;;
	12) veureDetallDirectori ;;
	13) . main.sh;;
	*) echo "$op Invalid option"
esac

done
