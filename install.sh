#!/bin/bash

install_brew()
{
    #### install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

install_helpers()
{
    brew install --cask shiftit
    brew install --cask karabiner-elements
    cp karabiner/karabiner.json ~/.config/karabiner/
    brew install yarn
    brew install ack
    brew install neovim
    brew install tmux
    brew install wget
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.3
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
}

install_neovim()
{
    #### set up nvim
    echo -n "Configuring NVIM..."
    mkdir -p ~/.config/nvim
    cat neovim/init.vim > ~/.config/nvim/init.vim
    echo "DONE."
}

install_zsh()
{
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo -n "Configuring oh-my-zsh..."
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    cp .zshrc ~/.zshrc
    echo "DONE."
    echo -n "Setting up Powerlevel9k fonts..."
    wget -O PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget -O 10-powerline-symbols.conf https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    read -n 1 -r -s -p $'Opening fonts to install...Press ENTER.\n'
    open PowerlineSymbols.otf
    echo "Awesome."
}

install_tmux()
{
    #### set up tmuxinator
    echo -n "Configuring TMUX..."
    cp .tmux.conf ~/.tmux.conf
    echo "DONE."
}

configure_zprofile()
{
    read -n 1 -r -s -p $'Need sudo to update /etc/zprofile to ensure new tmux sessions does not mess up PATH...PRESS ENTER TO TYPE PASSWORD\n'
    echo -n "Copying zprofile...."
    sudo mv /etc/zprofile /etc/zprofile_bak
    sudo cp zprofile /etc/zprofile
    echo "DONE."
}



quit_script()
{
  echo "Interrupted. Exiting now..."
  kill $PPID
  exit 1
}


trap quit_script SIGINT
echo "What should we do today?"
select choice in "brew" "helpers" "neovim" "tmux" "zsh" "zprofile" "i'm done"; do
    case $choice in
        brew ) install_brew; break;; 
        helpers ) install_helpers; break;;
        neovim ) install_neovim; break;;
        tmux ) install_tmux; break;;
        zsh ) install_zsh; break;;
        zprofile ) configure_zprofile; break;;
        "i'm done" ) echo "You are awesome!"; exit;;
    esac
done

#### Aliases
echo -n "Adding aliases..."
cat .aliases > ~/.oh-my-zsh/custom/aliases.zsh
echo "DONE."
