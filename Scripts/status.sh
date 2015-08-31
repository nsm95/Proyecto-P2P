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
        echo
        echo -n "Indique una opcion: "
}
until [ "$opc" = "5" ];
do
    case $opc in

        1) 

        echo "--------------------------------------------"
        echo "-          Estatus Servicio LAMP           -"
        echo "--------------------------------------------"
        echo
                sudo /etc/init.d/apache2 status
        echo
        echo ----------------------------------------------
        echo
                sudo /etc/init.d/mysql status

        echo
        _MENU
        ;;


        2) 

        echo "--------------------------------------------"
        echo "-          Estatus Servicio SAMBA          -"
        echo "--------------------------------------------"
        echo
                sudo /etc/init.d/samba status

         echo
        _MENU
        ;;

        3) 
    
        echo "--------------------------------------------"
        echo "-          Estatus Servicio NO-IP          -"
        echo "--------------------------------------------"
        echo

            sudo /usr/local/bin/noip2 -S


        echo
        _MENU
        ;;

        4) 

        echo "--------------------------------------------"
        echo "-      Estatus Servicio Transmission       -"
        echo "--------------------------------------------"
        echo

               sudo /etc/init.d/transmission-daemon status
        
        echo
        _MENU
        ;;


        5) sudo ./install.sh ;;

                *)
                clear
                _MENU
                ;;

        esac
read opc
done
