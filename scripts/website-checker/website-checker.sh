#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide a URL."
    exit 1
fi

LOGFILE="$HOME/website-status.log"
EMAIL="test@gmail.com"
URL=$1
CHECK_INTERVAL=300 # The time interval between we have to check the website status

echo "Starting website checker script..."
echo "Logging to: $LOGFILE"
echo "Checking URL: $URL"

check(){
	if curl -s --head "$URL" | head -n 1 | grep "200 OK" > /dev/null; then
		echo "$(date): The $URL is up!"
		echo "$(date): The $URL is up!" >> "$LOGFILE"
	else
		echo "$(date): The $URL is down! :(" >> "$LOGFILE"
		echo "ALERT - $URL is down!" | sendmail "$EMAIL"
	fi
}

while true; do
	check
	sleep "$CHECK_INTERVAL"
done

# All logs:  cat ~/website-status.log
