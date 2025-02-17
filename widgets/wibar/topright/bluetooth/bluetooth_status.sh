#!/bin/bash

if [[ $(bluetoothctl show | grep Powered | awk '{print $2}') = "yes" ]]; then
	if [[ -n  $(bluetoothctl devices Connected) ]]; then
		echo "CONNECTED"
	else
		echo "ON"
	fi
else
	echo "OFF"
fi


