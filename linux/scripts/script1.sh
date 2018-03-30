#!/bin/bash

#Variables
DOCUMENTS="/home/test/Documents"

#If user enters 'day' show calendar and date
SHOWDAY=$1

if [ "$1" == "day" ]
then
#Display calendar
cal

#Display UTC format
date -u
fi

#Display greeting
echo "Hello there $LOGNAME!"

#Conditional
if [ "$PWD" == "$HOME" ]
then
	echo "You are home."
else
	echo "You are in $PWD"
fi

#Show what we have to work today
for doc in "$DOCUMENTS"/*.txt
do
	echo "$doc"
done
