#!/bin/bash

#This script will take a file and directory as input and create a backup copy and Changes the permissions of the original file/directory.

# Prompt user to enter file or directory name
read -p "Enter the file or directory name: " target

# Check if the file/directory exists
if [ ! -e "$target" ]; then
    echo "Error: $target does not exist."
    exit 1
fi

# Create a backup with timestamp to avoid overwriting
backup_name="$target-$(date +%Y%m%d%H%M%S).bak"

if [ -d "$target" ]; then
    # If it's a directory, use -r for recursive copy
    cp -r "$target" "$backup_name"
else
    # If it's a file, simple copy
    cp "$target" "$backup_name"
fi

echo "Backup created as $backup_name"

# Ask user for new permissions
read -p "Enter new permissions (octal, e.g., 644 or 755): " perms

# Change permissions
chmod -R "$perms" "$target"

echo "Permissions of $target changed to $perms successfully."
