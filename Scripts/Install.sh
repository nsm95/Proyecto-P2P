#! /bin/bash

_MENU()
{

        echo "Pasos a seguir para la correcta instalación y configuración de su servidor P2P: "
        echo
        echo "1) Configuración de red."
        echo "2) Instalación Necesaria."
        echo "3) Opciones de los servicios."
        echo "4) Status de los servicios."
        echo "5) Salir."
        echo
        echo -n "Indique una opcion: "
}
until [ "$opc" = "5" ];
do
        case $opc in
                1)  sudo ./conf-red.sh
                    clear
                        _MENU ;;

                2)  sudo ./install-nece.sh
                    clear
                        _MENU ;;

                3)      sudo ./opc-conf-servicios.sh
                    clear
                        _MENU ;;

                4)      sudo ./status.sh
                    clear
                        _MENU ;;

                5) exit ;;

                *)
                clear
                _MENU
                ;;

        esac
read opc
done
