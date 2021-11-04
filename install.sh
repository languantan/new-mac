#!/bin/bash

#### install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#### install helpers
brew cask install shiftit
brew cask install karabiner-elements
brew install yarn
brew install ack
brew install neovim

#### install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.3
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

#### Aliases
cat .aliases >> ~/.aliases

#### set up nvim
cat neovim/init.vim > ~/.config/nvim/init.vim

#### set up tmuxinator
cp .tmux.conf ~/.tmux.conf

#### copy key bindings for ESC key
cp karabiner/karabiner.json ~/.config/karabiner/
