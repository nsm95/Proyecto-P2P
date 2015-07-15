#! /bin/bash

_MENU()
{
        echo "Opciones y configuraciones de los servicios instalados: "
        echo
        echo "1) Servicio Apache."
        echo "2) Servicio OpenSSH."
        echo "3) Servicio Pydio."
        echo "4) Servicio Samba."
        echo "5) Servicio NO-IP."
        echo "6) Servicio Telegram."
        echo "7) Servicio Transmission."
        echo "8) Salir."
        echo
        echo -n "Indique una opcion: "
}
until [ "$opc" = "8" ];
do
        case $opc in
                1)  sudo ./apache.sh
                    clear
            		_MENU ;;

                2)  sudo ./openssh.sh
                    clear
            		_MENU ;;

                3)	sudo ./pydio.sh
                    clear
            		_MENU ;;

                4)	sudo ./samba.sh
                    clear
            		_MENU ;;

                5)	sudo ./noip.sh
                    clear
            		_MENU ;;

                6)	sudo ./telegram.sh
                    clear
            		_MENU ;;

                7)	sudo ./transmission.sh
                    clear
            		_MENU ;;

                8) sudo ./install.sh ;;

                *)
                clear
                _MENU
                ;;

        esac
read opc
done
