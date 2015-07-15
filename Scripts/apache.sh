#!/bin/bash

_MENU()
{
    echo "Opciones del servicio Apache: "
    echo
    echo "1) Iniciar Servicio Apache."  
    echo "2) Parar Servicio Apache."
    echo "3) Reiniciar Servicio Apache."
    echo "4) Desinstalar Servicio Apache."
    echo "5) Salir." 
    echo   
    echo -n "Indique una opcion: "
}
until [ "$opc" = "5" ];
do
    case $opc in

        1)  sudo /etc/init.d/apache2 start
            echo
            echo
            echo "Servicio iniciado correctamente"
            sleep 2
            clear
            _MENU 
            ;;

        2)  sudo /etc/init.d/apache2 stop 
            echo
            echo
            echo "Servicio parado correctamente"
            sleep 2
            clear
            _MENU
            ;;
        
        3)  sudo /etc/init.d/apache2 restart 
            echo
            echo
            echo "Servicio reiniciado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        4)  sudo apt-get -y purge apache2 mysql-server libapache2-mod-php5 php5 php5-mcrypt
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
