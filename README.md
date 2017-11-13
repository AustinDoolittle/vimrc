My Default .vimrc File
======================

This is the default .vimrc file that I prefer to use. I keep it publicly hosted on github more for my convenience than anything, but feel free to use it and make it your own.

# Installation Instructions
1. Run `git clone https://github.com/AustinDoolittle/vimrc.git` in any folder.
2. Run `cd vimrc` to enter the repo directory
3. Run `. install.sh`. This script:
  * Backs up the current ~/.vimrc file to ~/.vimrc.bak if this file is not a symlink
  * Creates symbolic link `~/.vimrc` which points to the `.vimrc` file located in this git repository
  * Opens vim and runs PluginInstall

**NOTE:** This script only needs to be ran once when the repo is cloned. Running it again may lead to overwritting the backup of the vimrc initially on the computer


