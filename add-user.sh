#!/bin/bash
# This script creates users
# The script accept user's full name, user id, pasword, primary group and secodndary groups (separated by comma)
# Then the script will	-> formulate username (as <firstname>.<lastname> format
#			-> create user's home directory (/home/<username>) with rwx------ permissions
read -p "Please input user's first name: " FIRSTNAME
clear
read -p "Please input user's last name: " LASTNAME
clear
read -p "Please input user's desired password: " PASSWORD
clear
read -p "Please input user's desired User ID or press enter to skip: " UID
clear
read -p "Please input users's primary group or press enter to skip: " P_GROUP
clear
read -p "Please input user's secondary group or press enter to skip: " SEC_GROUP
clear

# adding a new user to the system
echo "Adding a new user to the system..."
useradd -m -c "$FIRSTNAME $LASTNAME" "$FIRSTNAME.$LASTNAME" -p "$PASSWORD" -g "$P_GROUP"

sleep 2
if test "$UID" -eq 0
	then
	# pass
	clear		
else
	# appends user id if mentioned
	usermod "$FIRSTNAME.$LASTNAME" --uid "$UID"
fi

if test "$SEC_GROUP" != ""
	then
	# add secondary groups if mentioned
	usermod "$FIRSTNAME.$LASTNAME" -G "$SEC_GROUP"
fi
echo "User added successfully..."
