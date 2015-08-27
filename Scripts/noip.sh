#! /bin/bash

_MENU()
{
        echo "Opciones del servicio NO-IP: "
        echo
        echo "1) Crear el script para iniciar automaticamente."
        echo "2) Información. "
        echo "3) Volver atras."
        echo
        echo -n "Indique una opcion: "
}
until [ "$opc" = "3" ];
do
        case $opc in

                1) echo "#! /bin/bash
                ### BEGIN INIT INFO
                # Provides: blabla
                # Required-Start: $syslog
                # Required-Stop: $syslog
                # Default-Start: 2 3 4 5
                # Default-Stop: 0 1 6
                # Short-Description: blabla
                # Description:
                #
                ### END INIT INFO
                sudo /usr/local/bin/noip2" > /etc/init.d/noip2
                        sudo chmod +x /etc/init.d/noip2
                        sudo update-rc.d noip2 defaults
                        echo
                        echo "Script creado correctamente"
                        sleep 4
                        _MENU
                        ;;

                2)  
                echo
                echo "PARA PODER ACCEDER A NUESTRA PI DESDE LA CALLE, TENDRÁ QUE CONECTARSE A TRAVES DE PUTTY Y PONER SU HOST. "
                echo
                 _MENU
                    ;;

                3) sudo ./opc-conf-servicios.sh ;;

                *)
                clear
                _MENU
                ;;

	esac
read opc
done
