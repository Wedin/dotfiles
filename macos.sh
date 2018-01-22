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

# Set size (px) of Dock items
defaults write com.apple.dock tilesize -int 32

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
# Keyboard
###############################################################################

# Increase speed for keyboard repeat rate
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2

# Slow keys = tröga tangenter
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

###############################################################################
# Language
###############################################################################

defaults write NSGlobalDomain AppleLanguages -array "sv-SE" "en-SE"
defaults write NSGlobalDomain AppleLocale -string "sv_SE"

###############################################################################
# General
###############################################################################

defaults write com.apple.screencapture type jpg

###############################################################################
# Mail
###############################################################################

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

###############################################################################
# Safari
###############################################################################

defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

# Disable popups
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false



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
# iTerm2
###############################################################################

# Set iTerm2 Profile to custom folder
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Projects/dotfiles/apps/iTerm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Don’t ask before quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# The rest of iTerm settings are set from the preferences file.

###############################################################################
# Karabiner Elements
###############################################################################

file_exist ~/.config/karabiner/karabiner.json
cp apps/Karabiner-Elements/karabiner.json ~/.config/karabiner/karabiner.json

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
