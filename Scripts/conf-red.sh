#!/bin/bash

_MENU()
{
        echo "Configuración de red: "
        echo
        echo "1) Configurar la red se su PI"
        echo "2) Salir."
        echo
        echo -n "Indique una opcion: "
}
until [ "$opc" = "2" ];
do

case $opc in

        1)

echo "--------------------------------------------"
echo "-          Configuración de red            -"
echo "--------------------------------------------"
echo

if [ $LOGNAME != "root" ]
    then
        read -p "Lo siento, este script debe ser ejecutado con privilegios de root."
        exit 1
    fi

    echo "Realizando copias de seguridad..."
    echo
        if [ -f /etc/network/interfaces ]
            then
                cp /etc/network/interfaces /etc/network/interfaces.original
        if [ $? -eq 0 ]
            then
              echo "El archivo interfaces ha sido salvaguardado con éxito."
            else
                echo "Error al salvaguardar el archivo interfaces."
            fi
 fi
echo
         if [ -f /etc/resolv.conf ]
         then
          cp /etc/resolv.conf /etc/resolv_original.conf
        if [ $? -eq 0 ]
            then
              echo "El archivo resolv.conf ha sido salvaguardado con éxito."
         else
                 echo "Error al salvaguardar el archivo resolv.conf."
             fi
         fi
echo
echo "Mostrando interfaces de red actuales..."
for nic in `lshw -short -class network | grep eth | tr -s " " | cut -f2 -d" " `
do
    echo "* Interfaz: $nic"
done

echo "-----------------------------------------------------"

interfaz=""
while [ "$interfaz" == "" ]
do
    read -p "Elige la interfaz que deseas configurar: " interfaz
done

interfaz=1
for nic in `lshw -short -class network | grep eth | tr -s " " | cut -f2 -d" " `
do
    if [ $nic == $interfaz ]
    then
        interfaz=0
    fi
done

echo "La interfaz elegida es: $nic"
read -p "Introduce la nueva dirección ip estática: " ip
read -p "Introduce la nueva máscara de red: " mascara
read -p "Introduce la puerta de enlace: " puerta
read -p "Introduce el DNS 1º: " dns1
read -p "Introduce el DNS 2º: " dns2
echo
read -p "Pulse una tecla para continuar."

respuesta=""
while [ "$respuesta" == "" ]
do
    read -p "Desea grabar estos datos de configuración (S/N): " respuesta
    case $respuesta in
        s|S)

        #Modificación de /etc/network/interfaces
        interfaces="/etc/network/interfaces"
        echo "auto lo" > $interfaces
        echo "iface lo inet loopback" >> $interfaces
        echo
        echo "auto $nic" >> $interfaces
        echo "allow-hotplug $nic" >> $interfaces
        echo "iface $nic inet static" >> $interfaces
        echo "address $ip" >> $interfaces
        echo "netmask $mascara" >> $interfaces
        echo "gateway $puerta" >> $interfaces

        #Modificación de /etc/resolv.conf
        resolv="/etc/resolv.conf"
        echo "nameserver $dns1" >> $resolv
        echo "nameserver $dns2" >> $resolv

#Reinicio de la red
/etc/init.d/networking restart

break;;
        n|N)echo "Ok, no se modificarán los archivos de configuración"; read; break;;
        *) echo "No ha introducido una respuesta válida, vuelva a intentarlo.";;
    esac
done
_MENU
;;

        2) sudo ./install.sh ;;

        *)
        clear
        _MENU
        ;;
    esac
read opc
done
                                                                          