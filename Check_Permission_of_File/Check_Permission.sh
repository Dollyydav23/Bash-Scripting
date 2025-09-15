#!/bin/bash

# This script will check the if the file is Readable, Writeable, and Exacutable by the user.

# Taking the input from the user 

read -p "Enter file name: " filename

# Checking if file exists or not
if [ ! -e "$filename" ]; then
    echo "File does not exist."
    exit 1
fi

# Check if file is readable
if [ -r "$filename" ]; then
    echo "File $filename is readable"
else
    echo "File $filename is not readable"
fi

# Check if file is writable
if [ -w "$filename" ]; then
    echo "File $filename is writable"
else
    echo "File $filename is not writable"
fi

# Check if file is executable
if [ -x "$filename" ]; then
    echo "File $filename is executable"
else
    echo "File $filename is not executable"
fi
