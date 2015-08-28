#!/bin/bash

_MENU()
{
    echo "Opciones del servicio Apache: "
    echo
    echo "1) Iniciar Servicio Apache."  
    echo "2) Parar Servicio Apache."
    echo "3) Reiniciar Servicio Apache."
    echo "4) Iniciar Servicio Mysql." 
    echo "5) Parar Servicio Mysql."
    echo "6) Reiniciar Servicio Mysql."
    echo "7) Desinstalar Servicio LAMP."
    echo "8) Volver atras." 
    echo   
    echo -n "Indique una opcion: "
}
until [ "$opc" = "8" ];
do
    case $opc in

        1)  sudo /etc/init.d/apache2 start
            echo
            echo
            echo "Servicio iniciado correctamente"
            sleep 2
            _MENU 
            ;;

        2)  sudo /etc/init.d/apache2 stop 
            echo
            echo
            echo "Servicio parado correctamente"
            sleep 2
            _MENU
            ;;
        
        3)  sudo /etc/init.d/apache2 restart 
            echo
            echo
            echo "Servicio reiniciado correctamente"
            sleep 2
            _MENU
            ;;


        4)  sudo /etc/init.d/mysql start
            echo
            echo
            echo "Servicio iniciado correctamente"
            sleep 2
            _MENU 
            ;;

         5)  sudo /etc/init.d/mysql stop
             echo
             echo
             echo "Servicio parado correctamente"
             sleep 2
             _MENU 
             ;;

         6)  sudo /etc/init.d/mysql restart
            echo
            echo
            echo "Servicio reiniciado correctamente"
            sleep 2
            _MENU 
            ;;


        7)  sudo apt-get -y purge apache2 mysql-server libapache2-mod-php5 php5 php5-mcrypt
            echo
            echo "Servicio eliminado correctamente"
            sleep 4
            _MENU 
            ;;

        8)  sudo ./opc-conf-servicios.sh ;;

        *)
        clear
        _MENU
        ;;
    esac
read opc
done
