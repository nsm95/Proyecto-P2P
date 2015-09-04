#! /bin/bash

_MENU()
{

        echo "Paquetes a instalar: "
        echo
        echo "1) Instalar Servidor LAMP."
        echo "2) Instalar Servidor OpenSSH."
        echo "3) Instalar Servicio Pydio."
        echo "4) Instalar Servidor SAMBA"
        echo "5) Instalar Servicio NO-IP."
        echo "6) Instalar Servidor Transmission + Notificaciones PUSH."
        echo "7) Volver atras."
        echo
        echo -n "Indique una opcion: "
}
until [ "$opc" = "7" ];
do
        case $opc in
                1) sudo apt-get -y install  apache2 mysql-server libapache2-mod-php5 php5 php5-mcrypt
            echo
            echo "Servicio instalado correctamente"
            sleep 4
     
            _MENU
            ;;

                2) sudo apt-get install -y openssh-client openssh-server ssh
            echo
            echo "Servicio instalado correctamente"
            sleep 4

            _MENU
            ;;

                3) cd /home/pi
            sudo apt-get install mysql-server mysql-common mysql-client php5-mysql mcrypt

            sudo apt-get -y install php-mcrypt

            sudo /etc/init.d/apache2 restart

            cd /var/www

            sudo wget http://sourceforge.net/projects/ajaxplorer/files/pydio/stable-channel/6.0.8/pydio-core-6.0.8.zip

            sudo unzip pydio-core-6.0.8.zip

            sudo mv pydio-core-6.0.8 pydio

            sudo chmod -R 777 pydio

            sudo chmod -R 777 pydio/data

            cat /home/pi/AplicacionP2P/.htaccess /var/www/pydio
            echo
            echo "Servicio instalado correctamente"
            sleep 4
     
            _MENU
            ;;

                4) sudo apt-get -y install samba samba-common samba-common-bin samba-doc
            sudo sed -i "s/$(head -n 102 /etc/samba/smb.conf | tail -1)/    \security\ = user\ /g" /etc/samba/smb.conf
            echo
            echo "Servicio instalado correctamente"
            sleep 4
      
            _MENU
            ;;

                5) cd /home/pi
            wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
            tar -zxf noip-duc-linux.tar.gz
            cd noip-2.1.9-1/
            make
            sudo make install
            cd ..
            rm -r noip-duc-linux.tar.gz
            echo
            echo
            sleep 4
            _MENU
            ;;

                6) sudo apt-get -y install transmission transmission-daemon
                    cd /home/pi
                    sudo apt-get install python-dev
                    echo

                    sudo chmod -R 777 /etc/transmission-daemon
                    sudo /etc/init.d/transmission-daemon stop
                    echo
                    echo "Configuración transmission: "
                    read -p "Introduzca nombre de usuario: " var1

                    sudo sed -i "s%$(head -n 51 /var/lib/transmission-daemon/info/settings.json | tail -1)%    \"rpc-username\": \"$var1\", %g" /var/lib/transmission-daemon/info/settings.json
                    echo
                    read -p "Intruzca la contraseña: " var2

                    sudo sed -i "s%$(head -n 48 /var/lib/transmission-daemon/info/settings.json | tail -1)%    \"rpc-password\": \"$var2\", %g" /var/lib/transmission-daemon/info/settings.json
                    echo

                    sudo sed -i "s%$(head -n 53 /var/lib/transmission-daemon/info/settings.json | tail -1)%    \"rpc-whitelist-enabled\": "\false"\, %g" /var/lib/transmission-daemon/info/settings.json 
			echo "Configuración Pushetta: "
			read -p "Introduzca su API-Key: " men1
			read -p "Introduzca el nombre de su canal: " men2
			men3="$men1\", \"$men2\", \"La descarga fa finalizado con exito."

			sudo sed -i "s%$(head -n 18 /home/pi/AplicacionP2P/mensaje.py | tail -1)%\sendNotification\(\"$men3\") %g" /home/pi/AplicacionP2P/mensaje.py

                    crontab tarea.txt

                    sudo /etc/init.d/transmission-daemon start

                      echo "Servicio instalado correctamente"
            sleep 4
            _MENU
            ;;

                7) sudo ./Install.sh ;;

                *)
                clear
                _MENU
                ;;

        esac
read opc
done
