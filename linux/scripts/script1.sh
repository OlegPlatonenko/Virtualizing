#!/bin/bash

#Display calendar
cal

#Display UTC format
date -u

#Display greeting
echo "Hello there $LOGNAME!"

#Conditional
if [ "$PWD" == "$HOME" ]
then
	echo "You are home."
else
	echo "You are in $PWD"
fi
