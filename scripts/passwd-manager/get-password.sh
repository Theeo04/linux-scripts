#!/bin/bash

# Check if the script is run as root (with sudo)
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo."
    exit 1
fi

# Path to save the encrypted passwords
SAVED_PASSWORDS_PATH=/home/ggheorghe/Desktop/SavedPasswds.txt

# Function to get a password by service name
function get_password() {
    read -p "Introduce Service Name: " service
    echo

    result=$(grep "^$service:" "$SAVED_PASSWORDS_PATH")

    if [ -n "$result" ]; then
        echo "Found entry: $result"
        encrypted_password=$(echo "$result" | cut -d ':' -f 2)
        decrypted_password=$(echo "$encrypted_password" | openssl enc -aes-256-cbc -a -d -salt -pass pass:"$service")
        echo "The password for $service is $decrypted_password"
    else
        echo "No entry found for $service."
    fi
}

get_password
