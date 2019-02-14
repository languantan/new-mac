#!/bin/bash

#### Aliases
cat .aliases >> ~/.aliases

#### set up nvim
cat init.vim > ~/.config/nvim/init.vim

#### set up tmuxinator
cp .tmux.conf ~/.tmux.conf
