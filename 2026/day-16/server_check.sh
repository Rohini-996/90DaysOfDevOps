#!/bin/bash 

Service_Name="nginx"

read -p "Do you want to check the status of service?" Service_Name 

if [ $Service_Name == y ]; then 
	systemctl status nginx
else
	echo "Skipped"
fi
