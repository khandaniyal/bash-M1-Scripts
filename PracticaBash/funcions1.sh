#!/bin/bash

function despedidaEpica {
linea="------------------------------------------------------"
guion="-- "

echo ""
echo $linea
echo $guion
echo $guion"	A REVEURE $USER"
echo $guion
echo $linea
echo ""

}

function agregarUsuario { 
echo ""
read -p "Nom del usuario que vols crear: " nomUsuario
echo ""
if [[ $(getent passwd $nomUsuario) ]];then
	echo "Error: usuari existent"
	. op1.sh
else
	sudo adduser --force-badname $nomUsuario
	echo "Usuari creat satisfactoriament" 
fi
echo ""
}

function agregarGrupos {
echo ""
read -p "Escriu el nom del grup que vols crear: " grup

if [[ $(getent group $grup) ]];then
	echo "Error, grup existent."
	. op1.sh
else
	sudo addgroup $grup
	echo "Grup creat satisfactoriament" 
fi
echo ""

}

function menuModificarUsuarios {
linea="------------------------------------------------------"
guion="-- "
echo ""
read -p "Introduiex el usuari que vols modificar: " nomUsuari
echo ""					
if [[ $(getent passwd $nomUsuari) ]]; then
	echo $linea 
	echo " -c: Modifica el comentari de l’usuari"
	echo " -d: Modifica el directori de treball o home de l’usuari"
	echo " -e: Modifica la data d’expiració del compte. Format AAAA-MM-DD"
	echo " -G: Modificar altres grups als que pot formar part l’usuari (separat per comes)"
	echo " -l: Canvia el login o el nom de l’usuari"
	echo " -L: Bloqueja el compte d’usuari, no esborra res només el deshabilita"
	echo " -U: Desbloqueja un compte previament bloquejat amb l’opció -L"
	echo " passwd: Modifica la contrasenya de l’usuari"
	echo $linea
	echo ""
	read -p "Escull una opció: " op

while op; do
case $op in
	
	"-c") modificaComentario exit;;
	"-d") modificaDirectorio exit;;
	"-e") modificaFechaExpiracion exit;;
	"-G") modificaOtrosGrupos exit;;
	"-l") cambiarLoginNombreUsuario exit;;
	"-L") bloquearUsuario exit;;
	"-U") habilitarUsuario exit;;
	"passwd") modificarPasswd exit;;
	"back") .op1.sh;;
	*) echo "Opció no válida"
esac
done

fi
}

function modificaComentario {
echo ""
echo "Escriu el nou comentari"
read comentari
sudo usermod -c "$comentari" $nomUsuari
echo ""
echo "S'ha afegit el comentari"
echo ""
}

function modificaDirectorio {
echo ""
echo "Indica el nou directori:"
read directorio
sudo usermod -d $directorio $nomUsuari
echo ""
}

function modificaFechaExpiracion {
echo ""
read -p "Nova data d'expiració (separat per guions. Ej: YYYY-MM-DD): " data
sudo usermod -e $data $usuari
echo ""
}

function modificaOtrosGrupos {
echo "A quin grup vols afegir l'usuari $nomUsuari?"
read grup1
echo "Vols afegir-lo en algun grup mès? Y/n"
read confirmacio

if [ $confirmacio == "Y" || $confirmacio == "y" ];then
	echo "Nom del segon grup en el que vols afegir-lo:"
	read grup2
	echo "Vols afegir-lo en algun grup mès? Y/n"
	read confirmacio2
	if [ $confirmacio2 == "Y" || $confirmacio2 == "y" ];then
		echo "Nom del tercer grup en el que vols afegir-lo:"
		read grup3
		sudo usermod -G $grup1"," $grup2"," $grup3
		echo ""
		echo "S'ha afegit correctament"
	else
		sudo usermod -G $grup1"," $grup2
		echo "S'ha afegit correctament"
	fi
else
		sudo usermod -G $grup1
fi
}

function cambiarLoginNombreUsuario {

read -p "Esxriu el nom nou " nouNomUsuario

if [[ ! $? -eq 0 ]]; then
	sudo usermod -l $nomUsuario $nouNomUsuario
	echo "S'ha cambiat correctament el nom d'usuari"
else
	echo "Error: El usuari $nouNomUsuario ya existeix."
	
fi
}

function bloquearUsuario {
read -p "Segur que vols deshabilitar l'usuari $nomUsuari? Y/n" confirmacio
if [[ $confirmacio == "Y" || $confirmacio == "y" ]];then
	sudo usermod -l $nomUsuario	
else
	echo "Dacord, l'usuari $nomUsuario es mantindrà habilitat"
fi
}

function habilitarUsuario {
read -p "Quin usuari vols habilitar? " nomUsuario

id $nomUsuario &> /dev/null
if [ $? -eq 0 ]; then
	sudo usermod -U $nomUsuario
else
	echo "El nom usuari introduït no es pot habilitar perque no existeix."
fi
echo ""
}

function modificarPasswd {
read -p "Escriu el usuari on vols modificar el passwd: " nomUsuari
read -p "Posa la nova contrasenya: " passwd1
read -p "Si us plau, escriu de nou la contrasenya per confirmar: " passwd2

if [ $passwd1 != $passwd2 ]; then
    echo "Les contrasenyes no coincideixen."
    exit    
fi

id $nomUsuario &> /dev/null
if [ $? -eq 0 ]; then
    echo "$nomUsuario existeix... modifcant la contrasenya."
else
    echo "$nomUsuari no existeix - La contraseña no s'ha pogut actualitzar per $username"; exit 
fi
echo -e "$password1n$password1" | passwd $username

}

function modificarGrupo {
echo ""
read -p "Escriu el nou nom d'grup: " mod
egrep "^$mod" /etc/group >/dev/null
if [[ $? -eq 0 ]]; then
	echo "Error $mod ya existe"
        . op1.sh
else
        read -p "Escriu el nom d'grup: " groupname
        sudo groupmod --new-name $mod $groupname
        . op1.sh
fi
echo""
}

function eliminarUsuario {
read -p "Escriu el usuari que vols borra: " nomUsuario
egrep "^$nomUsuario" /etc/passwd >/dev/null
if [[ $? -eq 0 ]]; then
	read -p "Vols eliminar el directori? si/no: " confirmacio
	if [[ $confirmacio == si ]]; then
		sudo userdel -r $nomUsuario
        	echo "El usuari : $nomUsuario y directori se ha borrat"
        	. op1.sh
	else
        	sudo userdel $nomUsuaio
        	echo "El usuari : $nomUsuario se ha borrat"
        	. op1.sh
   	fi
else
	echo "Error $nomUsuario no existeix"
        . op1.sh
fi
}

function eliminarGrupo {
read -p "Escriu el grup que vols borrar: " groupname
egrep "^$groupname" /etc/group >/dev/null
if [[ $? -eq 0 ]]; then
	sudo groupdel $groupname
        echo "El grup : $groupname s'ha borrat"
        . op1.sh
else
        echo "Error $groupname no existeix"
        . op1.sh
fi
}

function listarUsuarios {
echo""
getent passwd
. op1.sh
}

function listarGrupos {
echo
getent group
. op1.sh
}

function cargaUsurarioMasiva {
source ~/.profile
}
