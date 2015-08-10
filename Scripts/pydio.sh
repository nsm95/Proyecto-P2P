#! /bin/bash

_MENU()
{
        echo "Opciones del servicio Pydio: "
        echo
        echo "1) Crear base de datos para Pydio."
        echo "2) Solucionar error de instalacion Pydio."
        echo "3) Volver atras."
        echo -n "Indica una opcion: "
}
until [ "$opc" = "3" ];
do
        case $opc in

                1)  read -p "Indique el nombre de la base de datos: " var1
                    sudo echo "DROP DATABASE IF EXISTS $var1 ;" > pydio.sql
                    sudo echo "CREATE DATABASE $var1;" >> pydio.sql
                    read -p "Indique el nombre de usuario para la base de datos: " var2
                    read -p "Indique una contraseña para la dicho usuario: " var3
                    sudo echo "CREATE USER $var2@localhost IDENTIFIED BY '$var3';" >> pydio.sql
                    sudo echo "GRANT ALL ON $var1.* TO $var2@localhost;" >> pydio.sql
                    sudo echo "FLUSH PRIVILEGES;" >> pydio.sql
                    mysql -u root -p --default-character-set=utf8 < pydio.sql
                    echo
                    echo "Base de datos creada correctamente"
                    sleep 4
                    clear
                    _MENU
                    ;;

                3) sudo echo "<IfModule mod_rewrite.c>
# You must set the correct values here if you want
# to enable webDAV sharing. The values assume that your 
# Pydio installation is at http://yourdomain/
# and that you want the webDAV shares to be accessible via 
# http://yourdomain/shares/repository_id/
RewriteEngine on
RewriteBase /pydio
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^shares ./dav.php [L]
RewriteRule ^api ./rest.php [L]
RewriteRule ^user ./index.php?get_action=user_access_point [L]
RewriteCond %{REQUEST_URI} !^/pydio/index
RewriteCond %{REQUEST_URI} !^/pydio/plugins
RewriteCond %{REQUEST_URI} ^/pydio/dashboard|^/pydio/welcome|^/pydio/settings|^/pydio/ws-
RewriteRule (.*) index.php [L]

#Following lines seem to be necessary if PHP is working
#with apache as CGI or FCGI. Just remove the #
#See http://doc.tiki.org/WebDAV#Note_about_Apache_with_PHP_as_fcgi_or_cgi

#RewriteCond %{HTTP:Authorization} ^(.*)
#RewriteRule ^(.*) - [E=HTTP_AUTHORIZATION:%1]

#Following lines may be necessary for a PHP-FPM setup
# to make sure that authorization is transmitted.
# Just remove the # at the beginning of the line
</IfModule> > " > /usr/share/pydio/.htaccess
		sudo a2enmod ssl
                sudo a2ensite default-ssl
                sudo /etc/init.d/apache2 restart
		sudo echo "<?php
/*
 * Copyright 2007-2013 Charles du Jeu <contact (at) cdujeu.me>
 * This file is part of Pydio.
 *
 * Pydio is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Pydio is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Pydio.  If not, see <http://www.gnu.org/licenses/>.
 *
 * The latest code can be found at <http://pyd.io/>.
 *
 * These configuration must be set at the very root loading of the framework
 */

/*
 * If you have a charset warning, or problems displaying filenames with accented characters,
 * check your system locale and set it in the form lang_country.charset
 * Example : fr_FR.UTF-8, fr_FR.ISO-8859-1, fr_FR.CP1252 (windows), en_EN.UTF-8, etc.
 *
 * Windows users may define an empty string
 * define("AJXP_LOCALE", "");
 */
define("AJXP_LOCALE", "es_ES.UTF-8");
//define("AJXP_LOCALE", "");


/*
 * If you encounter problems writing to the standard php tmp directory, you can
 * define your own tmp dir here. Suggested value is ajxp_path/data/tmp/
 * AJXP_DATA_PATH, AJXP_INSTALL_PATH are replaced automatically.
 *
 * See php.ini settings below for the session.save_path value as well.
 */
//define("AJXP_TMP_DIR", AJXP_DATA_PATH."/tmp");


/*
 * Additionnal php.ini settings
 * > Problems with tmp dir : set your own session tmp dir (create it and make it writeable!)
 * > Concurrent versions of AjaXplorer : use session.cookie_path to differentiate them.
 */
$AJXP_INISET = array();
//$AJXP_INISET["session.save_path"] = AJXP_DATA_PATH."/tmp/sessions";
//$AJXP_INISET["session.cookie_path"] = "/ajaxplorer";

/*
 * If you want to force the https, uncomment the line below. This will automatically
 * redirect all calls to ajaxplorer via http to the same URL with https
 */
define("AJXP_FORCE_SSL_REDIRECT", true);" > /etc/pydio/bootstrap_conf.php 
		;;

                4)  sudo ./opc-conf-servicios.sh ;;

                *)
                clear
                _MENU
                ;;

        esac
read opc
done
