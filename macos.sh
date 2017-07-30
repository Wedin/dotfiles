#!/usr/bin/env bash

###############################################################################
# Helpers
###############################################################################

prompt_exit_overwrite() {
   read -p "This will overwrite '$@'  Are you sure? (y/n) " -n 1;
    echo "";
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Exiting..."
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # exit
    fi
}

file_exist() {
  if [ -f "$@" ]; then
      prompt_exit_overwrite "$@"
  fi
}

###############################################################################
# Are you sure?
read -p "This will overwrite existing files in your home directory 😱. Are you sure? (y/n) " -n 1;
echo "";
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # exit
fi;

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# Dock
###############################################################################

# Make Dock items 40px
defaults write com.apple.dock tilesize -int 40

# Enable magnification
defaults write com.apple.dock magnification -bool true

# Magnification max size
defaults write com.apple.dock largesize -int 76

# Show indicatior for open programs
defaults write com.apple.dock show-process-indicators -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

echo "🎎  Dock prefs DONE! 🤘"

###############################################################################
# Finder
###############################################################################

# Default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

chflags nohidden ~/Library


###############################################################################
# Trackpad
###############################################################################

# Tap is click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# Enable three finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true

###############################################################################
# Language
###############################################################################

defaults write NSGlobalDomain AppleLanguages -array "sv-SE" "en-SE"
defaults write NSGlobalDomain AppleLocale -string "sv_SE"

###############################################################################
# Language
###############################################################################

defaults write NSGlobalDomain AppleLanguages -array "sv-SE" "en-SE"
defaults write NSGlobalDomain AppleLocale -string "sv_SE"

###############################################################################
# Mail
###############################################################################

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

###############################################################################
# Spectacle.app
###############################################################################

file_exist ~/Library/Application\ Support/Spectacle/Shortcuts.json
cp apps/Spectacle/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json
echo "👓  Spectacle prefs DONE! 🤘"

###############################################################################
# Sublime Text.app
###############################################################################

file_exist ~/Library/Application\ Support/Sublime\ Text/Preferences.sublime-settings
cp apps/Sublime\ Text/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings

echo "🍋  Sublime Text prefs DONE! 🤘"

###############################################################################
# Configs
###############################################################################


file_exist ~/.gitignore
cp .gitignore ~/.gitignore

file_exist ~/.gitconfig
cp .gitconfig ~/.gitconfig

file_exist ~/.zshrc
cp .zshrc ~/.zshrc

# Let's celebrate & kill affected apps
echo "ALL DONE! 🤘 Killing apps!"
sleep 1

for app in "Activity Monitor" \
  "Dock" \
  "Finder" \
  "Spectacle" \
  "SystemUIServer" \
  "Terminal" \
  "iTerm2" \
  "iCal"; do
  killall "${app}" &> /dev/null
done
