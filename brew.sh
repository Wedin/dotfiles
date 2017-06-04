########################################################
# Homebrew
########################################################

if [[ `uname` == "Darwin" ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo "Installing Homebrew..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew update
      brew install htop mysql nginx node ruby
  fi

  # http://github.com/sindresorhus/quick-look-plugins
  brew cask install qlimagesize quicklook-json qlmarkdown qlstephen qlcolorcode

  brew cask install slack google-chrome firefox vlc sublime-text spectacle spotify
fi
