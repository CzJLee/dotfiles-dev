#!/bin/bash

# Install Tesseract OCR
# https://github.com/tesseract-ocr/tesseract

# Packages which are always needed.
brew install automake autoconf libtool
brew install pkgconfig
brew install icu4c
brew install leptonica
# Packages required for training tools.
brew install pango
# Optional packages for extra features.
brew install libarchive
# Optional package for builds using g++.
brew install gcc

git clone https://github.com/tesseract-ocr/tesseract/
cd tesseract
./autogen.sh
mkdir build
cd build
# Optionally add CXX=g++-8 to the configure command if you really want to use a different compiler.
../configure PKG_CONFIG_PATH=/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/opt/libarchive/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig
make -j
# Optionally install Tesseract.
sudo make install
# Optionally build and install training tools.
make training
sudo make training-install