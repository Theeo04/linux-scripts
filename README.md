# Bash Scripts Repo

This repository contains several useful Bash scripts for various tasks including password management, website status checking, log file analysis, and a joke generator script created in Python.

## 1. Password Manager CLI

**Password Manager CLI** is a simple Bash script that helps you securely store and retrieve passwords directly from the terminal. All passwords are encrypted using the AES-256-CBC algorithm and saved locally on your computer, ensuring your data remains private and protected.

### How to Implement It

1. **Create Aliases for Scripts**

   - Open your aliases file:

     ```bash
     nano ~/.bash_aliases
     ```

   - Add the following aliases to make the scripts easier to use:

     ```bash
     alias addpw='sudo /home/ggheorghe/Desktop/LinuxScripts/scripts/passwd-manager/add-password.sh'
     alias getpw='sudo /home/ggheorghe/Desktop/LinuxScripts/scripts/passwd-manager/get-password.sh'
     ```

   - Save the file and apply the changes:

     ```bash
     source ~/.bash_aliases
     ```

2. **Using the Scripts**

   - To add a new password:

     ```bash
     addpw
     ```

     You will be prompted to enter the service name and password.

   - To retrieve a saved password:

     ```bash
     getpw
     ```

     Enter the service name to get the password.

## 2. Website Status Checker

**Website Status Checker** is a Bash script that monitors the availability of a specified website and logs the status to a file. The script checks the status of the website at regular intervals and can notify you if the website is down.

### How to Implement It

1. **Create an Alias for the Script**

   - Open your aliases file:

     ```bash
     nano ~/.bash_aliases
     ```

   - Add the following alias to make the script easier to use:

     ```bash
     alias checkwebsite='sudo /home/ggheorghe/Desktop/LinuxScripts/scripts/website-checker/website-checker.sh'
     ```

   - Save the file and apply the changes:

     ```bash
     source ~/.bash_aliases
     ```

2. **Using the Script**

   - To start checking a website:

     ```bash
     checkwebsite http://www.google.com
     ```

     The script will start monitoring the website and log the status in `/var/log/website-status.log`.

## 3. Log File Analyzer

**Log File Analyzer** is a Bash script that parses server log files (e.g., Apache, Nginx) and provides useful statistics or alerts in case of errors. It helps in understanding server activity and identifying issues.

### How to Implement It

1. **Prepare the Log File**

   - Ensure you have access to your server's log files. For Nginx, the log files are typically located in `/var/log/nginx/access.log` and `/var/log/nginx/error.log`.

2. **Using the Script**

   - Run the script with the path to the log file:

     ```bash
     sudo /home/ggheorghe/Desktop/LinuxScripts/scripts/log-analyzer/log-analyzer.sh /var/log/nginx/access.log
     ```

     The script will analyze the log file and provide statistics such as total requests, error rates, and common IP addresses or URIs.

## 4. Joke Generator (Python)

**Joke Generator** is a Python script that fetches jokes from an open API and displays them. It uses the `JokeAPI` for fetching jokes and provides a fun way to get random jokes from the terminal.

### How to Implement It

1. **Install Required Libraries**

   - Ensure you have Python installed. Install the `requests` library if you don't have it:

     ```bash
     pip install requests
     ```

2. **Run the Script**

   - Execute the script to get a random joke:

     ```bash
     python /home/ggheorghe/Desktop/LinuxScripts/scripts/joke-generator/joke-generator.py
     ```

     If the `flag.nsfw` is `true`, the script will display a different joke suitable for NSFW content.

---

Feel free to adjust the paths and filenames according to your actual setup and preferences.
