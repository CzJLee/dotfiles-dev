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
https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
source "$(dirname "${BASH_SOURCE[0]}")/macos.sh"


####################################################
# Run package installers
####################################################

# Brew
echo "Installing Brew Packages"
source "$(dirname "${BASH_SOURCE[0]}")/brew.sh"


# Cask
echo "Installing Cask Packages"
source "$(dirname "${BASH_SOURCE[0]}")/cask.sh"


# MAS
echo "Install Mac Store Apps"
source "$(dirname "${BASH_SOURCE[0]}")/mas.sh"


# Python pip
echo "Install Python pip packages"
source "$(dirname "${BASH_SOURCE[0]}")/pip.sh"

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

