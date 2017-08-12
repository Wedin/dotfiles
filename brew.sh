#!/usr/bin/env bash

########################################################
# Homebrew
########################################################

if [[ `uname` == "Darwin" ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
  fi

  brew install node

  brew tap caskroom/fonts
  brew cask install font-inconsolata
  brew cask install font-inconsolata-for-powerline
  brew cask install font-roboto-mono-for-powerline

  # http://github.com/sindresorhus/quick-look-plugins
  brew cask install qlimagesize quicklook-json qlmarkdown qlstephen qlcolorcode

  # install other apps
  brew cask install slack google-chrome firefox vlc sublime-text spectacle spotify dropbox skype iterm2

  brew install z
fi
