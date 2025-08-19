# 👥 User Management Automation Script

## Overview
A Bash script to automate user creation, assign groups, and set expiration policies for accounts.

## Features
- Create users in bulk from CSV
- Assign roles/groups
- Set password expiration
- Lock inactive users

## Technologies
- Linux
- Bash scripting

## Usage
Prepare a CSV (`users.csv`):
---

username,password,group
john,Pass@123,developers
jane,Pass@123,analysts

---


Run script:
```bash
chmod +x useradd.sh
sudo ./useradd.sh users.csv

```
---

Impact

Reduced IT admin work for onboarding new employees

Improved consistency in account provisioning


**Script (`useradd.sh`)**
```bash
#!/bin/bash
INPUT=$1
while IFS=, read -r username password group
do
  useradd -m -s /bin/bash -G $group $username
  echo "$username:$password" | chpasswd
  chage -M 90 $username
  echo "User $username created in group $group"
done < $INPUT
```
