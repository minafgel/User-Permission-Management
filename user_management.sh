#!/bin/bash

# ---------------------------
# User and Permission Management Script
# ---------------------------
# Tasks:
# - Create a new user
# - Create and assign user to a group
# - Set file permissions for a specific directory
# ---------------------------

# Set variables
USERNAME="developer01"
USERGROUP="devteam"
USERHOME="/home/$USERNAME"
WORKDIR="/home/$USERNAME/projects"

# Check if the group exists, create if not
if getent group $USERGROUP > /dev/null; then
    echo "Group '$USERGROUP' already exists."
else
    echo "Creating group '$USERGROUP'."
    sudo groupadd $USERGROUP
fi

# Check if the user exists, create if not
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists."
else
    echo "Creating user '$USERNAME' and assigning to group '$USERGROUP'."
    sudo useradd -m -s /bin/bash -G $USERGROUP $USERNAME
    echo "Set a password for $USERNAME:"
    sudo passwd $USERNAME
fi

# Create a working directory
echo "Creating working directory at $WORKDIR."
sudo mkdir -p $WORKDIR
sudo chown $USERNAME:$USERGROUP $WORKDIR

# Set permissions: owner rwx, group rx, others no access
echo "Setting permissions (750) on $WORKDIR."
sudo chmod 750 $WORKDIR

# Verify permissions
echo "Verifying setup."
ls -ld $WORKDIR
id $USERNAME

echo "User, group, and permissions successfully configured."
