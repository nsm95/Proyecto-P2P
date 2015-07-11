#! /bin/bash
_MENU()
{
        echo "Pasos a seguir para la correcta instalación de su servidor P2P: "
        echo
        echo "1) Configuración de red."
        echo "2) Instalación Necesaria."
        echo "3) Opciones de los servicios."
        echo "4) Status de los servicios."
        echo "5) Salir."
        echo -n "Indique una opcion: "
}
until [ "$opc" = "5" ];
do
        case $opc in
                1)  sudo ./conf-red.sh
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

                8) exit ;;

                *)
                clear
                echo "Por favor indique una de las siguientes opciones"
                _MENU
                ;;

        esac
read opc
done
