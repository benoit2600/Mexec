#!/bin/bash -x
# 11 oct 2014
# Author : FAUQUE Benoit
# V2.0.0
# 
# check the number of time the script is called during the "sleep" delai
# and execute a command depending of that.

CONFIGFILE="/tmp/$$-randomdfgdfgbvdfh3658v4f32g5b46a5é46-è5.vars"

#  Check if there is already an instance of the script launch, and MAJ the count variable
if [ -r ${CONFIGFILE} ]; then
	count=`cat $CONFIGFILE | cut -f1 -d " "`
	old_pid=`cat $CONFIGFILE | cut -f2 -d " "`
	let count++
	echo $count $$> $CONFIGFILE
	kill -9 $old_pid
else
	count=1
	echo $count $$ > $CONFIGFILE
	
fi

sleep 0.2 # delai between 2 launch of the script
case $count in
	1) xdotool key "Control_L+F11";;
	2) xdotool key "F12";;
	3) xdotool key "F10";;
esac

rm $CONFIGFILE
