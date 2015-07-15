#!/bin/bash

_MENU()
{
    echo "Opciones y configuración del servicio Transmission: "
    echo
    echo "1) Configurar directorio de Torrents COMPLETOS."
    echo "2) Configurar directorio de Torrents INCOMPLETOS."
    echo "3) Iniciar Servicio Transmission."  
    echo "4) Parar Servicio Transmission."
    echo "5) Reiniciar Servicio Transmission."
    echo "6) Desinstalar Servicio Transmission."
    echo "7) Salir."    
    echo -n "Indique una opcion: "
}
until [ "$opc" = "7" ];
do
    case $opc in

        1) sudo chmod -R 777 /etc/transmission-daemon
        sudo /etc/init.d/transmission-daemon stop
            read -p "Lugar del nuevo directorio de Torrents COMPLETOS: " var1
        sudo sed -i "s%$(head -n 15 /etc/transmission-daemon/settings.json | tail -1)%    \"download-dir\": \"$var1\", %g" /etc/transmission-daemon/settings.json
        sudo sed -i "s%$(head -n 15 /var/lib/transmission-daemon/info/settings.json | tail -1)%    \"download-dir\": \"$var1\", %g" /var/lib/transmission-daemon/info/settings.json
        sudo /etc/init.d/transmission-daemon start
            echo "Cambio realizado correctamente"
        clear
            _MENU
            ;;

        2) sudo chmod -R 777 /etc/transmission-daemon
        sudo /etc/init.d/transmission-daemon stop
            read -p "Lugar del nuevo directorio de Torrents INCOMPLETOS: " var2
        sudo sed -i "s%$(head -n 23 /etc/transmission-daemon/settings.json | tail -1)%    \"incomplete-dir\": \"$var2\", %g" /etc/transmission-daemon/settings.json
        sudo sed -i "s%$(head -n 23 /var/lib/transmission-daemon/info/settings.json | tail -1)%    \"incomplete-dir\": \"$var2\", %g" /var/lib/transmission-daemon/info/settings.json
        sudo sed -i "s/$(head -n 24 /etc/transmission-daemon/settings.json | tail -1)/    \"incomplete-dir-enabled\": \"true\", /g" /etc/transmission-daemon/settings.json
        sudo sed -i "s/$(head -n 24 /var/lib/transmission-daemon/info/settings.json | tail -1)/    \"incomplete-dir-enabled\": \"true\", /g" /var/lib/transmission-daemon/info/settings.json
        sudo /etc/init.d/transmission-daemon start
            clear
            _MENU
            ;; 

        3)  sudo /etc/init.d/transmission-daemon start
            echo
            echo
            echo "Servicio iniciado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        4)  sudo /etc/init.d/transmission-daemon stop
            echo
            echo
            echo "Servicio parado correctamente"
            sleep 2
            clear
            _MENU
            ;;
            

        5)  sudo /etc/init.d/transmission-daemon restart
            echo
            echo
            echo "Servicio reiniciado correctamente"
            sleep 2
            clear
            _MENU
            ;;

        6)  sudo apt-get -y purge transmission transmission-daemon
            echo
            echo
            echo "Servicio eliminado correctamente"
            sleep 4
            clear
            _MENU
            ;;

        7) sudo ./opc-conf-servicios.sh ;;
  
        *)
        clear
        _MENU
        ;;
    esac
read opc
done
