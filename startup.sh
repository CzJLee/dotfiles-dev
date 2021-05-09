#!/bin/bash

# Startup install basic packages

# Ask for the administrator password upfront
sudo -v

####################################################
# Install Homebrew
####################################################

echo "Installing Brew"
# Remove old install method
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


####################################################
# Apply macOS preferences
####################################################

# Run macOS preferences dotfile
echo "Installing Cask Packages"
# Execute script relative to this script's directory
# https://stackoverflow.com/questions/6659689/referring-to-a-file-relative-to-executing-script
source "${BASH_SOURCE%/*}/macos.sh"


####################################################
# Run package installers
####################################################

# Brew
echo "Installing Brew Packages"
source "${BASH_SOURCE%/*}/brew.sh"

# Cask
echo "Installing Cask Packages"
source "${BASH_SOURCE%/*}/cask.sh"

# MAS
echo "Install Mac Store Apps"
source "${BASH_SOURCE%/*}/mas.sh"

# Python pip
echo "Install Python pip packages"
source "${BASH_SOURCE%/*}/pip.sh"


####################################################
# Config Git
####################################################

git config --global user.name "Christian Lee"
git config --global user.email "54609773+CzJLee@users.noreply.github.com"
git config --global credential.helper osxkeychain
git config --global core.editor "code --wait" # Set VS Code as the default text edit for Git messages


####################################################
#Restart Computer
####################################################

echo "Done. Note that some of these changes require a logout/restart to take effect."
# Restart after showing a confirmation dialog
osascript -e 'tell app "loginwindow" to «event aevtrrst»'

####################################################

