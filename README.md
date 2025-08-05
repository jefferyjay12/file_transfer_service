File Transfer Script to AWS EC2 using rsync
This script transfers files from your local machine to an AWS EC2 instance using rsync over SSH. It automatically logs the transfer process and handles basic error checking.

Prerequisites
AWS EC2 Instance:

Must have an EC2 instance running with SSH access.

Ensure the EC2 instance's security group allows SSH inbound traffic on port 22.

SSH Key Pair:

Ensure you have an SSH key pair (.pem file) for authentication.

The script uses groupKeyPair.pem for SSH authentication. Update the script if using a different key.

UFW Firewall:

The script configures UFW on the EC2 instance to allow SSH traffic. Ensure that UFW is installed and configured.

Required Tools:

rsync: Make sure rsync is installed on your local machine.

ssh: Ensure ssh is available on your local machine for remote connection.

Configuration
SOURCE_DIR: The directory on your local machine that you want to transfer.

DEST_USER: The username on your EC2 instance (default: ubuntu).

DEST_HOST: The public IP address or DNS of your EC2 instance.

DEST_DIR: The target directory on the EC2 instance to copy the files to.

SSH_KEY_PATH: Path to the private SSH key used for authentication.

LOG_FILE: Location where transfer logs are saved.

Usage
Configure the script:

Edit the script and update the SOURCE_DIR, DEST_USER, DEST_HOST, DEST_DIR, and SSH_KEY_PATH variables according to your setup.

Make sure the KeyPair is in the same directory as the script

Run the script:

bash
Copy code
bash transfer_script.sh
Monitor the transfer:

Check the log file (transfer.log) for details of the transfer.

Logs will include information on successful transfers or errors.

Example Log Output
ruby
Copy code
