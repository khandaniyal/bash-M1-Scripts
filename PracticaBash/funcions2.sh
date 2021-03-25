#!/bin/bash

function crearFitxer {
	read -p "Indica la ruta on vols crear el fitxer " path
	#comprova que és una ruta correcta. Si és incorrecte mostra un missatge. Si és correcta:
		
	read -p "Indica el nom del fitxer " fitxer
	read -p "Indica l'extensió del fitxer " extensio
	
	if [[ -d "$path" ]]; then

		touch $path/$fitxer$extensio
	else
		echo "El directorio $path no existe"
	fi

	echo ""
}
function llegirFitxer {
	read -p "Indica el nom del fitxer que vols llegir " fitxer
	
	if [[ -f "$fitxer" ]]; then

		cat $fitxer
	else
		echo "No se puede leer el fichero $fitxer porque no existe"
	fi

	echo ""
}

function eliminarFitxer {
	read -p "Indica el nom del fitxer que vols eliminar " fitxer
	
	#Elimina el fitxer
	if [[ -f "$fitxer" ]]; then

                rm $fitxer
        else
                echo "No se puede eliminar el fichero $fitxer porque no existe "
        fi
	
	echo ""
}

function canviarPermisos {
	read -p "Indica el nom del fitxer que vols modificar els permisos " fitxer
	
	read -p "Quins permisos li vols assignar? " permisos

	#Modifica els permisos del fitxer
	if [[ -f "$fitxer" ]]; then

                chmod +$permisos $fitxer
        else
                echo "No se pueden modificar los permisos del fichero $fitxer porque no existe"
        fi
	
	echo ""
}

function assignarUsuariPropietari {
	read -p "Indica el nom del fitxer " fitxer
	read -p "Indica el nom de l'usuari " usuari

	#Assigna l'usuari propietari
	if [[ -f $fitxer ]]; then
                chown $grup $fitxer
        else
                echo "Error: El fichero $fitxer no exite."
        fi
}


function assignarGrupPropietari {
	read -p "Indica el nom del fitxer " fitxer
	read -p "Indica el nom del grup " grup
	
	#Assigna l'usuari propietari
	if [[ -f $fitxer ]]; then
		chgrp $grup $fitxer
	else
		echo "Error: El fichero $fitxer no exite."
	fi	
}

function veureMascara {
	umask
	#Visualitza la màscara
	return 0
}

function assignarMascara {
	read -p "Quina màscara vols assignar? " mascara
	#Assigna màscara
	umask $mascara
} 

function crearDirectori {
	read -p "Escriu la ruta i el nom del nou directori que vols crear " directori
	
	#Crea el directori
	mkdir $directori
}

function moureDirectori {
	read -p "Escriu el directori que vols moure " directoriOrigen
	read -p "Escriu la ruta on el vols moure " directoriDesti
	
	#Mou el directori
	if [[ -d "$directoriOrigen" && -d "$directoriDesti" ]]; then
	
		mv $directoriOrigen $directoriDesti
	else
		echo "No se puede mover el directorio $directoriOrigen al directorio $directoriDesti"
	fi

	echo ""
}

function eliminarDirectori {
	read -p "Escriu la ruta del directori que vols eliminar " directori

	#Comprova que el directori existeix
	#Comprova si el directori està buit, si està buit elimina'l si està ple pregunta si vols eliminar tot l'interior
	
	if [ -z "$(ls -A $directori)" ]; then
		echo "Empty"
	else
		echo "Not Empty"
	fi
	
	echo ""
}

function veureDetallDirectori {
	read -p "Escriu la ruta del directori que vols visualitzar " directori
	
	if [[ -d "$directori" ]]; then
		ls -l $directori
	else
		echo "El directorio $directori no existe"
	fi
}
