# Bash Scripts Repo

This repository contains several useful Bash scripts for various tasks including password management, website status checking, log file analysis and a joke generator script created in Python.

## 1. Password Manager CLI

Password Manager CLI is a simple Bash script that helps you securely store and retrieve passwords directly from the terminal. All passwords are encrypted using the AES-256-CBC algorithm and saved locally on your computer, ensuring your data remains private and protected.

### How to implement it ?

- Create an alias for functions created: 'add-password.sh' and 'get-password.sh'
  ```bash
  nano ~/.bash_aliases

- Add the following aliases, which are making the script easier to use:
  ```bash
  alias addpw='sudo /home/ggheorghe/Desktop/LinuxScripts/scripts/passwd-manager/add-password.sh'
  alias getpw='sudo /home/ggheorghe/Desktop/LinuxScripts/scripts/passwd-manager/get-password.sh'

- Now call the functions - as su:
  ![image](https://github.com/user-attachments/assets/a4afecc1-6c38-4ddd-b020-72d0a60ffdc0)

