#!/bin/bash

_MENU()
{
    echo "Opciones del servicio SSH: "
    echo
    echo "1) Iniciar Servicio OpenSSH."  
    echo "2) Parar Servicio OpenSSH."
    echo "3) Reiniciar Servicio OpenSSH."
    echo "4) Desinstalar Servidor OpenSSH."
    echo "5) Salir."    
    echo -n "Indica una opcion: "
}
until [ "$opc" = "5" ];
do
    case $opc in

        1)	sudo /etc/init.d/ssh start
            echo
            echo "Servicio instalado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        2)	sudo /etc/init.d/ssh stop
            echo
            echo "Servicio instalado correctamente"
            sleep 2
            clear
            _MENU
            ;;
        
        3)	sudo /etc/init.d/ssh restart
            echo
            echo "Servicio instalado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        4)	sudo apt-get purge -y openssh-client openssh-server ssh
            echo
            echo "Servicio eliminado correctamente"
            sleep 4
            clear
            _MENU
            ;;	

        5)  sudo ./opc-conf-servicios.sh ;;

        *)
        clear
        _MENU
        ;;
    esac
read opc
done
