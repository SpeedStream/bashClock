#!/bin/bash

# PARA EJECUTAR: ./client.sh <IP> <PORT>
while :
	do
		#Abrimos el puerto en el IP y leemos
		#Guardamos el valor que leemos en val
		val=$(netcat $1 $2)

		#Debido al refresh cada 0.2s, habrá momentos donde no tengamos nada
		if [ -z $val ]; then
			#Si $val es vacío, realizamos un echo
			echo
		else
			#Si existe un valor $val, entonces realizamos el fork y mostramos con display la imagen correspondiente
			(display -remote $val.jpg) &
		fi
		sleep 0.2
	done