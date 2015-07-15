#! /bin/bash

_MENU()
{

        echo "Paquetes a instalar: "
        echo
        echo "1) Instalar Servidor Apache (LAMP)."
        echo "2) Instalar Servidor OpenSSH."
        echo "3) Instalar Servicio Pydio."
        echo "4) Instalar Servidor SAMBA"
        echo "5) Instalar Servicio NO-IP."
        echo "6) Instalar Servicio Telegram."
        echo "7) Instalar Servidor Transmission."
        echo "8) Salir."
        echo
        echo -n "Indique una opcion: "
}
until [ "$opc" = "8" ];
do
        case $opc in
                1) sudo apt-get -y install  apache2 mysql-server libapache2-mod-php5 php5 php5-mcrypt
            echo
            echo "Servicio instalado correctamente"
            sleep 4
            clear
            _MENU
            ;;

                2) sudo apt-get install -y openssh-client openssh-server ssh
            echo
            echo "Servicio instalado correctamente"
            sleep 4
            clear
            _MENU
            ;;

                3) cd /home/pi
            wget http://kent.dl.sourceforge.net/project/ajaxplorer/pydio/stable-channel/6.0.7/pydio_6.0.7_all.deb
            sudo dpkg -i pydio_6.0.7_all.deb
            sudo apt-get -f -y install
            sudo cp /usr/share/doc/pydio/apache2.sample.conf /etc/apache2/sites-enabled/pydio.conf
            sudo service apache2 restart
            echo
            echo "Servicio instalado correctamente"
            sleep 4
            clear
            _MENU
            ;;

                4) sudo apt-get -y install samba samba-common samba-common-bin samba-doc
            sudo sed -i "s/$(head -n 102 /etc/samba/smb.conf | tail -1)/    \security\ = user\ /g" /etc/samba/smb.conf
            echo
            echo "Servicio instalado correctamente"
            sleep 4
            clear
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
            _MENU
            ;;

                6) cd /home/pi
            sudo apt-get install -y libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make git python python-sip python-mysqldb
            sudo git clone --recursive https://github.com/vysheng/tg.git && cd tg
            sudo ./configure --disable-json
            make
            echo
            echo "Servicio Instalado correctamente"
            sleep 4
            _MENU
            ;;

                7) sudo apt-get -y install transmission transmission-daemon
            echo
            echo
            echo "Servicio instalado correctamente"
            sleep 4
            clear
            _MENU
            ;;

                8) sudo ./install.sh ;;

                *)
                clear
                _MENU
                ;;

        esac
read opc
done
