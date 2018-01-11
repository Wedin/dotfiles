#!/usr/bin/env bash

# Copies app configs to this repo
# Overrites all existing

# Are you sure?
read -p "🚀  This will copy files to this directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # exit
fi;

########################################################
# Spectacle.app
########################################################

cp ~/Library/Application\ Support/Spectacle/Shortcuts.json apps/Spectacle/Shortcuts.json

########################################################
# Sublime Text
########################################################

cp ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings apps/Sublime\ Text/Preferences.sublime-settings


########################################################
# VS Code
########################################################

cp ~/Library/Application\ Support/Code/User/settings.json apps/Code/settings.json
cp ~/Library/Application\ Support/Code/User/keybindings.json apps/Code/keybindings.json
cp -R ~/Library/Application\ Support/Code/User/snippets/ apps/Code/snippets/



########################################################
# Other
########################################################
cp ~/.gitconfig .gitconfig
cp ~/.gitignore .gitignore
cp ~/.zshrc .zshrc

echo "Backup finished!"
