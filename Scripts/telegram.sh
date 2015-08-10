#! /bin/bash

_MENU()
{
        echo "Opciones del servicio Telegram: "
        echo
        echo "1) Cambiar número de teléfono de Telegram."
        echo "2) Volver atras."
        echo -n "Indica una opcion: "
}
until [ "$opc" = "2" ];
do
        case $opc in

                1) sudo rm -r /root/.telegram-cli/
		cd tg
		sudo bin/telegram-cli -k tg-server.pub -W
                clear
                _MENU
                ;;

                2) sudo ./opc-conf-servicios.sh ;;

                *)
                clear
                _MENU
                ;;

        esac
read opc
done
