#!/bin/bash

#Pipes a escribir
# dmin umin : dseg useg
#   0   0   :  0    0
usegF="usegF"	#Unidades de segundo 	-> Pipe de Unidades de Segundo
dsegF="dsegF"	#Decenas de segundo 	-> Pipe de Decenas de Segundo
uminF="uminF"	#Unidades de minuto 	-> Pipe de Unidades de Minuto
dminF="dminF"	#Decenas de minuto 		-> Pipe de Decenas de Minuto

while :
	do
		#Obtenemos minutos y segundos
		SEG=$(date +%S)
		MIN=$(date +%M)
		
		#Separamos las unidades y decenas de cada uno
		useg=$(expr $SEG % 10)
		dseg=$(expr $SEG / 10)
		umin=$(expr $MIN % 10)
		dmin=$(expr $MIN / 10)
		
		#Dirigimos cada valor individual al pipe correspondiente
		echo "$useg" > ${usegF}
		echo "$dseg" > ${dsegF}
		echo "$umin" > ${uminF}
		echo "$dmin" > ${dminF}
		
		#Abrimos un puerto con netcat
		#Enviamos el valor correspondiente
		netcat -l 3333 < usegF
		netcat -l 3334 < dsegF
		netcat -l 3335 < uminF
		netcat -l 3336 < dminF
		#Esperamos 0.5seg para volver a escribir
		#Con esto impedimos una des-sincronización
		sleep 0.5
	done