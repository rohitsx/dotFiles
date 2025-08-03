#!/bin/bash

i3status | while :
do
	read line
	TEMP=$(~/.config/i3/scripts/cpu_temp.sh)
	echo "${TEMP} | ${line:0:-1} "
done

