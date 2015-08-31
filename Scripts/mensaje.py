#Importamos la libreria
import urllib2
import json
#Esta es la funcion que usara el script para enviar las notificaciones
def sendNotification(token, channel, message):
        data = {
                "body" : message,
                "message_type" : "text/plain"
        }

        req = urllib2.Request('http://api.pushetta.com/api/pushes/{0}/'.format(channel))
        req.add_header('Content-Type', 'application/json')
        req.add_header('Authorization', 'Token {0}'.format(token))

        response = urllib2.urlopen(req, json.dumps(data))

#Enviamos la notificacion en formato '<strong>Apikey+Canal+Mensaje</strong>'
sendNotification("fb232cf502fda3c39c9107cb32f0b6573877798a", "mensajes", "La descarga ha finalizado con exito!")

#Avisamos al usuario de que ya se ha enviado el mensaje
print "Mensaje enviado!"

