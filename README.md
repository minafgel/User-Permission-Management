# Linux User and Permission Automation Script

This Bash script automates basic Linux user and group management tasks. It is ideal for system administrators who want to quickly configure users and secure project directories.

## Features
- Automatically creates users and groups
- Assigns user to group
- Creates working directories under `/home/user/projects/`
- Sets secure file permissions (`750`)

## Usage
Update variables at the top of the script:
```bash
USERNAME="developer01"
USERGROUP="devteam"

## Then run:
```bash
chmod +x user_management.sh
sudo ./user_management.sh

## Permissions Logic
* Owner: Full access (read, write, execute)
* Group: Limited access (read, execute)
* Others: No access

