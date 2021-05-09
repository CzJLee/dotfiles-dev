#!/bin/bash

# MacOS Preferences

echo "Setting up some system preferences..."

echo "Quit System Preferences to prevent it from overriding changes"
osascript -e 'tell application "System Preferences" to quit'


###############################################################
# System Preferences
###############################################################

echo "Hiding Public Folder"
chflags hidden ~/Public

echo "Autohide the dock"
defaults write com.apple.dock autohide -bool true

echo "Set the dock autohide delay to 0 seconds"
defaults write com.apple.dock autohide-delay -float 0

echo "Set the dock autohide animation to 0.5 seconds"
defaults write com.apple.dock autohide-time-modifier -float 0.5

echo "Set the dock magnification to a value of 128"
defaults write com.apple.dock largesize -float 128

echo "Disable the dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

echo "Don't show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

echo "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "Show file path in finder window"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show column view in finder window"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "Trackpad: enable tap to click for this user and for the login screen "
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Trackpad: map bottom right corner to right-click "
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool false

echo "Disable “natural” (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "Set Home as the default location for new Finder windows"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

echo "Prevent Safari from opening ‘safe’ files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

echo "Disable password autofill"
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false

echo "Enable the Develop menu in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true

echo "Show Sidebar in top sites in Safari"
defaults write com.apple.Safari ShowSidebarInTopSites -bool true

echo "Warn about fraudulent websites"
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

echo "Enable Secure Keyboard Entry in Terminal.app"
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

echo "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "Disable guest account login"
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

echo "Do not show Macintosh HD icon on Desktop"
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

echo "Always boot in Verbose mode"
sudo nvram boot-args="-v"

echo "Expand save panel by default "
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "Expand print panel by default "
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "Disable the “Are you sure you want to open this application?” dialog "
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Disable the crash reporter "
defaults write com.apple.CrashReporter DialogType -string "none"

echo "Check for software updates daily, not just once per week "
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "Increase sound quality for Bluetooth headphones/headsets "
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo "Require password immediately after sleep or screen saver begins "
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Show all filename extensions "
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Display full POSIX path as Finder window title "
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "Avoid creating .DS_Store files on network or USB volumes "
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# echo "Empty Trash securely by default "
# # You would want this to be false if you want to have the chance to recover something accidenlty deleted. 
# defaults write com.apple.finder EmptyTrashSecurely -bool true

echo "Don’t group windows by application in Mission Control "
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

echo "Update refresh frequency (in seconds) for Activity Monitor "
# 1: Very often (1 sec)
# 2: Often (2 sec)
# 5: Normally (5 sec)
defaults write com.apple.ActivityMonitor UpdatePeriod -int 2

echo "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Set display sleep to 5 minutes"
sudo pmset -a displaysleep 5

echo "Auto install app updates"
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool TRUE

echo "Show menu bar items"
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/Volume.menu" \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu"
	
echo "Show battery percentage"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

killall SystemUIServer
killall Dock
killall Finder

#echo "Done. Note that some of these changes require a logout/restart to take effect."

# Restart after showing a confirmation dialog
#osascript -e 'tell app "loginwindow" to «event aevtrrst»'

