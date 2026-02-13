#!/bin/bash 

read -p "Enter a Number" Number 

if [ $Number -lt 0 ]; then
	echo "NUmber is negative"
elif [ $Number -gt 0 ]; then
	echo "Number is positive"
else 
	echo "Number is equal"
fi
