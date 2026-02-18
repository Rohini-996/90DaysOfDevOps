#!/bin/bash

# List of packages
packages=("nginx" "curl" "wget")

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (sudo ./install_packages.sh)"
    exit 1
fi

# Update package list once
apt update -y

# Loop through packages
for pkg in "${packages[@]}"
do
    echo "Checking $pkg..."

    if dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "$pkg is already installed ✅"
    else
        echo "$pkg not installed. Installing..."
        apt install -y "$pkg"
        echo "$pkg installed successfully ✅"
    fi

    echo "-------------------------"
done

