#!/bin/bash

# Exit immediately if any command fails
set -e

# Create directory
mkdir /tmp/devops-test || { echo "Failed to create directory"; exit 1; }

# Navigate into directory
cd /tmp/devops-test || { echo "Failed to enter directory"; exit 1; }

# Create a file
touch test.txt || { echo "Failed to create file"; exit 1; }

echo "All steps completed successfully ✅"

