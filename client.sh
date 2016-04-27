#!/bin/bash

outPipe="outPipe"
while :
	do
		val=$(netcat $1 $2)
		echo $val > outPipe
		display $val.jpg
		sleep 0.5
	done