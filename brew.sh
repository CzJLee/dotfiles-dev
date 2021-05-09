#!/bin/bash

# Brew packages

echo "Install MAS"
brew install mas

echo "Install Python 3"
brew install python@3.8 #Most packages don't work on 3.9

echo "Install Node for JavaScript"
brew install node

echo "Install speedtest-cli"
brew install speedtest-cli

echo "Install Youtube-dl"
brew install youtube-dl

echo "Install FFmpeg"
brew install ffmpeg

echo "Install Git LFS"
# https://git-lfs.github.com
brew install git-lfs
git lfs install

echo "Install Mongo CLI"
brew tap mongodb/brew
brew install mongocli #Mongo CLI
brew install mongodb-community@4.4 #Mongo Shell