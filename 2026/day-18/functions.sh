#!/bin/bash

# Function 1: greet
greet() {
    echo "Hello, $1!"
}

# Function 2: add
add() {
    sum=$(($1 + $2))
    echo "Sum is: $sum"
}

# Calling the functions
greet Rohini
add 10 20

