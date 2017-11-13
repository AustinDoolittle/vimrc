#!usr/bin/env bash

# Backup the current vimrc
if [ -e "~/.vimrc" ]
then
	if [ -e "~/.vimrc.bak" ]
	then
		echo "~/.vimrc.bak already exists, delete this file before running this script so the backup is not lost"
		exit 1
	else
		mv "~/.vimrc" "~/.vimrc.bak"
	fi
fi

# Create a link to the repo's vimrc
ln -s "./.vimrc" "~/.vimrc"
