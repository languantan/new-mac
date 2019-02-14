#!/bin/bash

#### install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#### install helpers
brew cask install shiftit
brew install yarn
brew install ack

#### Aliases
cat .aliases >> ~/.aliases

#### set up nvim
cat init.vim > ~/.config/nvim/init.vim

#### set up tmuxinator
cp .tmux.conf ~/.tmux.conf

