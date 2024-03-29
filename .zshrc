# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$ANT_HOME/bin"
export PATH="$HOME/Dev/:$PATH"
export PATH="/opt/homebrew/bin/brew:$PATH"
export GOPATH="$HOME/Dev/golang"
export TERM="xterm-256color"
export EDITOR="nvim"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
ZSH_THEME="powerlevel9k/powerlevel9k"
###########################
# PowerLevel9K Customization
export POWERLEVEL9K_CONTEXT_TEMPLATE="%m"
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
export POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='088'
export POWERLEVEL9K_DIR_HOME_FOREGROUND='009'
export POWERLEVEL9K_DIR_HOME_BACKGROUND=$POWERLEVEL9K_DIR_DEFAULT_BACKGROUND
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$POWERLEVEL9K_DIR_DEFAULT_BACKGROUND
export POWERLEVEL9K_DIR_ETC_FOREGROUND=$POWERLEVEL9K_DIR_DEFAULT_FOREGROUND
export POWERLEVEL9K_DIR_ETC_BACKGROUND=$POWERLEVEL9K_DIR_DEFAULT_BACKGROUND
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status)
export POWERLEVEL9K_VI_INSERT_MODE_STRING=''
export POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='teal'
export POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='teal'
export POWERLEVEL9K_VI_COMMAND_MODE_STRING='command mode'
export POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='red'
export POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='yellow'
###########################

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow kubectl vi-mode z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

eval $(/opt/homebrew/bin/brew shellenv)
