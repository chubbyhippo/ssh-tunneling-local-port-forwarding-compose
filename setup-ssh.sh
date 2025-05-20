#!/bin/bash

# Default values if variables are not set
DEFAULT_USER=${SSHD_USER:-root}
DEFAULT_PASS=${SSHD_PASSWORD:-rootpwd}

# Create the default user (if not root)
if [ "$DEFAULT_USER" != "root" ]; then
  useradd -m -s /bin/bash "$DEFAULT_USER"
fi

# Set password for the user
echo "$DEFAULT_USER:$DEFAULT_PASS" | chpasswd

# Ensure the SSH service is configured
mkdir -p /run/sshd