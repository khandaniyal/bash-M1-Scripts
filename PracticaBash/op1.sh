#!/bin/bash
. funcions1.sh

linea="------------------------------------------------------"
guion="-- "

echo ""
echo $linea
echo $guion"	1. Afegir un usuari"
echo $guion"	2. Afegir un grup"
echo $guion"	3. Modificar un usuari"
echo $guion"	4. Modificar un grup"
echo $guion"	5. Eliminar un usuari"
echo $guion"	6. Eliminar un grup"
echo $guion"	7. Llista els usuaris del sistema"
echo $guion"	8. Llista els usuaris del grup"
echo $guion"	9. Carregar usuaris de manera massiva"
echo $guion"	10. Tornar"
echo $linea
echo ""

read -p "Escull una opció: " op

while true; do
case $op in
	1) agregarUsuario exit;;
	2) agregarGrupos exit;;
	3) menuModificarUsuarios exit;;
	4) modificarGrupo exit;;
	5) eliminarUsuario exit;;
	6) eliminarGrupo exit;;
	7) listarUsuarios exit;;
	8) listarGrupos exit;;
	9) cargaUsurarioMasiva exit;;
	10)  . main.sh exit;;
	*) echo "Opcíó no válida."
esac

done
