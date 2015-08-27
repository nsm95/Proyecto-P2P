#!/bin/bash

_MENU()
{
    echo "Opciones y configuración del servicio Transmission: "
    echo
    echo "1) Cambiar nombre de usuario. "
    echo "2) Cambiar contraseña. "
    echo "3) Contenido de la carpeta de Torrents COMPLETOS."
    echo "4) Contenido de la carpeta de Torrents INCOMPLETOS."
    echo "5) Iniciar Servicio Transmission."  
    echo "6) Parar Servicio Transmission."
    echo "7) Reiniciar Servicio Transmission."
    echo "8) Desinstalar Servicio Transmission."
    echo "9) Información. "
    echo "10) Volver atras."    
    echo
    echo -n "Indique una opcion: "
}
until [ "$opc" = "10" ];
do
    case $opc in
 


        1)
        _MENU 
        ;;
            
        2)
        _MENU
        ;;

        3) ls /var/lib/transmission-daemon/downloads
        echo
            _MENU
            ;;

        4) ls /root/Downloads 
        echo
            _MENU
            ;; 

        5)  sudo /etc/init.d/transmission-daemon start
            echo
            echo
            echo "Servicio iniciado correctamente"
            sleep 2
            _MENU
            ;;

        6)  sudo /etc/init.d/transmission-daemon stop
            echo
            echo
            echo "Servicio parado correctamente"
            sleep 2
            _MENU
            ;;
            

        7)  sudo /etc/init.d/transmission-daemon restart
            echo
            echo
            echo "Servicio reiniciado correctamente"
            sleep 2
            _MENU
            ;;

        8)  sudo apt-get -y purge transmission transmission-daemon
            echo
            echo
            echo "Servicio eliminado correctamente"
            sleep 4
            _MENU
            ;;

        9) 
        echo
        echo "PARA PODER ACCEDER A TRANSMISSION, TENDRÁ QUE DIRIGIRSE A UN NAVEGADOR Y ESCRIBIR LA DIRECCIÓN IP DE SU RASPBERRY MÁS :9091, ejemplo "192.168.1.x:9091""
        echo
                 _MENU
                    ;;


        10) sudo ./opc-conf-servicios.sh ;;
  
        *)
        clear
        _MENU
        ;;
    esac
read opc
done
