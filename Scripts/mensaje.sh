#!/bin/bash

#
#Creacion del mensaje#
#$TR_APP_VERSION
#$TR_TIME_LOCALTIME
#$TR_TORRENT_DIR
#$TR_TORRENT_HASH
#$TR_TORRENT_ID
#$TR_TORRENT_NAME

MENSAJE="Tu Torrent #$TR_TORRENT_ID: [#$TR_TORRENT_NAME] lo he descargado en #$TR_TORRENT_DIR a las #$TR_TIME_LOCALTIME."

#Envio del mensaje
