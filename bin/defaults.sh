#!/bin/bash

set -eu

# Common
## Show all filename extensions
defaults write -g AppleShowAllExtensions -bool true
## Use F1, F2, etc. keys as standard function keys
defaults write -g com.apple.keyboard.fnState -bool true
## Trackpad
### Disable two finger navigation
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false

# Trackpad
## Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
## Enable three finger navigation
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -bool true

# Dock
## Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
## Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true
## Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Finder
## Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
## Show path bar
defaults write com.apple.finder ShowPathbar -bool true
## Show full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
## Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Desktop
## Prevent .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
## Prevent .DS_Store files on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Screenshot
## Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

echo "Done. Some changes may require a logout/restart to take effect."