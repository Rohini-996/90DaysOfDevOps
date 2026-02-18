#!/bin/bash 

# Create a list of 5 fruits using for loop 

Fruits=("Apple", "Banana", "Cherry", "Mango", "Watermelon")

for fruit in "${Fruits[@]}"
do 
	echo "$fruit"
done 
