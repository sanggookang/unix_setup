#!/bin/bash

# Install xcode command line tools
xcode-select --install

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update homebrew
brew update && brew upgrade

# Install vim
brew install vim git zsh

# Set zsh to be default shell
sudo echo "$(which zsh)" >> /etc/shells
chsh -s $(which zsh)

#Install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

