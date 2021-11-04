#!/bin/bash

trap - SIGINT
#### install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

quit_script()
{
  echo "Interrupted. Exiting now..."
  kill $PPID
  exit 1
}


trap quit_script SIGINT
#### install helpers
echo "Do you need Helpers?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
	    brew install --cask shiftit
	    brew install --cask karabiner-elements
	    cp karabiner/karabiner.json ~/.config/karabiner/
	    brew install yarn
	    brew install ack
	    brew install neovim
	    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.3
	    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
	    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
            break;; 
        No ) echo "Skipped Helpers."; break;;
    esac
done

#### set up nvim
echo -n "Configuring NVIM..."
mkdir -p ~/.config/nvim
cat neovim/init.vim > ~/.config/nvim/init.vim
echo "DONE."

#### set up tmuxinator
echo -n "Configuring TMUX..."
cp .tmux.conf ~/.tmux.conf
echo "DONE."

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -n "Configuring oh-my-zsh..."
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
cp .zshrc ~/.zshrc
echo "DONE."

#### Aliases
echo -n "Adding aliases..."
cat .aliases > ~/.oh-my-zsh/custom/aliases.zsh
echo "DONE."
