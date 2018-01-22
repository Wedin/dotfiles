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
  brew cask install slack vlc spotify dropbox skype iterm2
  brew cask install karabiner-elements spectacle
  brew cask install google-chrome firefox
  brew cask install sublime-text visual-studio-code
  brew install z zsh zsh-completions dark-mode
fi

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

