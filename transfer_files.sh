#!/bin/bash

# Source directory on your local machine
SOURCE_DIR="$HOME/myproject/"

# Destination user and host on the AWS EC2 instance

DEST_USER="ubuntu"
DEST_HOST="3.139.86.86"
DEST_DIR="/home/ubuntu/"

# Set the desired name and location for the new key pair
KEY_NAME="groupKeyP"
KEY_PATH="$HOME/.ssh/$KEY_NAME"
PUBLIC_KEY_PATH="$KEY_PATH.pub"

# Path to your SSH private key.
# This is crucial for authentication. Update this if your key name or location is different.

SSH_KEY_PATH="$HOME/groupKeyPair.pem"

# Log file location in a user-writable directory
 LOG_FILE="$HOME/myproject/transfer.log"

# Set firewall rules

sudo ufw allow ssh
sudo ufw --force enable

# Create or append to the log file.
echo "$(date): Starting file transfer from $SOURCE_DIR to $DEST_USER@$DEST_HOST:$DEST_DIR" >> "$LOG_FILE"

# Sync the file
rsync -avhz -e "ssh -i $SSH_KEY_PATH" "$SOURCE_DIR" "$DEST_USER@$DEST_HOST:$DEST_DIR"


# Check the exit status of the last command (rsync)

if [ $? -eq 0 ]; then
	echo "$(date): File transfer completed successfully." >> "$LOG_FILE"
else
	# $? is not zero, so the command failed
	echo "$(date): ERROR - File transfer failed with exit code $?." >> "$LOG_FILE"
fi

echo "Script finished." >> "$LOG_FILE"
