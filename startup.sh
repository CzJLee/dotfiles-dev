#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Install Brew
echo "Installing Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Execute script relative to this script's directory
# https://stackoverflow.com/questions/6659689/referring-to-a-file-relative-to-executing-script
source "${BASH_SOURCE%/*}/test.sh"