#!/bin/bash

var1=`ls /var/lib/transmission-daemon/downloads | wc -l`

#echo "copiada var 1"

sleep 5

var2=`ls /var/lib/transmission-daemon/downloads | wc -l`

#echo "Variables copiadas"

if [ $var2 -gt $var1 ];
        then
                #echo "mensaje enviado 2"
                sudo python /home/pi/AplicacionP2P/mensaje.py
                sleep 5
                cd /home/pi/AplicacionP2P
                ./comprobar.sh
        else
        		#echo "No hay nuevo fichero"
        		cd /home/pi/AplicacionP2P
        		./comprobar.sh
fi