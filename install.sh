#!/bin/sh
echo $0
VIMRC="$HOME/.vimrc"
VIMRC_BAK="$HOME/.vimrc.bak"
REPO_VIMRC="$PWD/.vimrc"

# Backup the current vimrc
if [ -e "$VIMRC" ];
then
	if [ -L "$VIMRC" ];
	then
		echo "Current .vimrc file is a symlink pointing to $(readlink "$VIMRC"), deleting symlink"
		rm "$VIMRC"
	elif [ -e "$VIMRC_BAK" ];
	then
		echo "$VIMRC_BAK already exists, delete this file before running this script so the backup is not lost"
		exit 1
	else
		mv "$VIMRC" "$VIMRC_BAK"
	fi
fi

# Create a link to the repo's vimrc
ln -s "$REPO_VIMRC" "$VIMRC"

sudo apt-get install vim cmake python-dev libxml2-dev libxslt-dev
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

vim -c 'PluginInstall' -c 'qa!'
$HOME/.vim/bundle/youcompleteme/install.py --clang-completer

