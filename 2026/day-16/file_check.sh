#!/bin/bash 

read -p "Enter the file name which you want to know" file_name
if [ -f $file_name ]; then 
	echo "This file exist in your directory"

else
	echo "File dosen't exist"
fi
