#!/bin/bash

# The function for encryption (AES-256-CBC) is: echo "what-we-want-to-encrypt" | openssl enc -aes-256-cbc -a -salt -pass pass:"encrytion-key"

# Function for decryption: echo "crypted-text" | openssl enc -aes-256-cbc -a -d -salt -pass pass:"encryption-key"


# Check if the script is run as root (with sudo)
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo."
    exit 1
fi

SAVED_PASSWORDS_PATH=/home/ggheorghe/Desktop/SavedPasswds.txt

function add-password() {
	echo "Add a new password!"
	echo
	
	read -p "Introduce Service Name: " service
	read -sp "Introduce Password for $service: " password

	echo

	encrypted_passwd=$(echo "$password" | openssl enc -aes-256-cbc -a -salt -pass pass:"$service")

	echo "$service:$encrypted_passwd" >> "$SAVED_PASSWORDS_PATH"
    	echo "The password for $service is saved in $SAVED_PASSWORDS_PATH"
}

add-password

# How to add as aliases:
#  nano ~/.bash_aliases
#  alias addpw='sudo /PATH/add.password.sh'
#  source ~/.bash_aliases 
