#! /bin/bash

_MENU()
{
        echo "Estatus de los servicios instalados: "
        echo
        echo "1) Estatus del Servicio LAMP."
        echo "2) Estatus del Servicio Samba."
        echo "3) Estatus del Servicio NO-IP."
        echo "4) Estatus del Servicio Transmission."
        echo "5) Volver atras."
        echo -n "Indique una opcion: "
}
until [ "$opc" = "8" ];
do
    case $opc in

        1) 

        echo "--------------------------------------------"
        echo "-          Estatus Servicio LAMP           -"
        echo "--------------------------------------------"
        echo
                /etc/init.d/apache2 status
        echo
        echo ----------------------------------------------
        echo
                /etc/init.d/mysql status


        2) 

        echo "--------------------------------------------"
        echo "-          Estatus Servicio SAMBA          -"
        echo "--------------------------------------------"
        echo
                 /etc/init.d/samba status


        3) 
    
        echo "--------------------------------------------"
        echo "-          Estatus Servicio NO-IP          -"
        echo "--------------------------------------------"
        echo

                /etc/init.d/noip2 status

        4) 

        echo "--------------------------------------------"
        echo "-          Estatus Servicio Transmission   -"
        echo "--------------------------------------------"
        echo

                /etc/init.d/transmission-daemon status

        5) sudo ./install.sh ;;

                *)
                clear
                _MENU
                ;;

        esac
read opc
done
