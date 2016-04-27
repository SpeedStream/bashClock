#!/bin/bash

usegF="usegF"
dsegF="dsegF"
#uminF="uminF"
#dminF="dminF"

while :
	do
		SEG=$(date +%S)
		MIN=$(date +%M)
		useg=$(expr $SEG % 10)
		dseg=$(expr $SEG / 10)
		#umin=$(expr $MIN % 10)
		#dmin=$(expr $MIN / 10)
		echo "$useg" > ${usegF}
		echo "$dseg" > ${dsegF}
		#echo "$umin" > ${umin}
		#echo "$dmin" > ${dmin}
		netcat -l 3333 < usegF
		netcat -l 3334 < dsegF
		#netcat -l 3335 < uminF
		#netcat -l 3336 < dminF
		sleep 0.5
	done