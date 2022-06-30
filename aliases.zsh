#!/bin/bash
alias vim='nvim'
alias glrun="go run main.go"
alias rc-edit="vim $HOME/.zshrc"
alias nvim-init="nvim $HOME/.config/nvim/init.vim"
alias xcode='open -a Xcode'
alias 88="exit"
alias 881="source $HOME/.zshrc"

alias reloadvpn='sudo kextunload -b "net.sf.tuntaposx.tun";sudo kextunload -b "net.sf.tuntaposx.tap"'
alias loadvpn='sudo kextload -b "net.sf.tuntaposx.tun";sudo kextload -b "net.sf.tuntaposx.tap"'
alias rm="rm -i"

function gpr() {
    open $(git push 2>&1 | awk ' /  http/ {print $2}')
}
alias gbdd="git push origin --delete"

alias k='kubectl'
alias dls='docker ps -a'
alias dlsi='docker images'
alias db='docker build .'
alias dsa='docker start'
alias dso='docker stop'
alias dit='docker run --rm -it'
alias drm='docker rm'
alias drmi='docker rmi'
alias di='docker inspect'
alias dex='docker exec -it'

alias dcf="docker-compose -f"
alias dlog="docker-compose logs -f"
alias dcb="docker-compose build" 
alias dcls='docker-compose ps'
alias dcu='docker-compose up'
alias dcso='docker-compose stop'
alias dcsa='docker-compose start'
alias dce='docker-compose exec -it'
alias dce='docker-compose exec'
alias dcrm='docker-compose rm -f'

alias hammer='open /Applications/Hammerspoon.app'

function getssh() {
    cat ~/.ssh/config | grep -A 5 $1
}
function doenv() {
    eval "$(docker-machine env default)"
}
function drmis() {
    echo "deleting images with '$1'..."
        command="docker images | grep '$1' | awk '{print \$3}'"
        eval $command
        if [[ $(eval $command)  ]]; then
            docker rmi -f $(eval $command) 
        else
            echo "no images found"; 
    fi;
}
function doskill() {
    docker rm $(docker ps -a -q)
}

function _checkout() {
    local branch_name=$2
        if [[ $branch_name == *"remotes"* ]]; then
            echo "[$1]: Found a remote branch with no local branch, will checkout a tracking local branch"
                echo $branch_name | cut -d/ -f3- | xargs git checkout
        else
            echo $branch_name | xargs git checkout
                fi;
}

function gcsb() {
    local command='git branch'
        while getopts ":ha" option; do
            case $option in
                h) echo "usage: $0 [-h] [-a] [pattern]\nexample: gsb master"; return ;;
    a) command='git branch -a' ;;
    ?) echo "error: option -$OPTARG is not implemented"; return ;;
    esac
        done
        shift $((OPTIND-1))

        local pattern=$@

        if [[ -z "$pattern" ]]; then
            echo "[$0]: no pattern provided"; return;
    fi;

    local b=$(eval $command | awk 'tolower($0) ~ /'$pattern'/')
        local branch_count=$(echo $b | sed '/^\s*$/d' | wc -l)
        if [ $branch_count -eq 0 ]; then
            echo "[$0]: No branch matches the pattern: "$pattern
                elif [ $branch_count -eq 1 ]; then
                _checkout $0 $b
        else
            echo "[$0]: More than one branch match the pattern: "$pattern
                eval $command | awk 'BEGIN{ i = 1} tolower($0) ~ /'$pattern'/{print i++ ": " $0}'
                echo "[$0]: Enter INDEX of the branch that you want to switch to: "
                read selected_branch_index
                local selected_branch=$(eval $command | awk 'tolower($0) ~ /'$pattern'/{i++}i=='$selected_branch_index'{print; exit}')
                echo $selected_branch
                _checkout $0 $selected_branch
                fi;
}


function ip() {
    local copy=false
        while getopts ":hc" option; do
            case $option in
                h) echo "usage: $0 [-h] [-c] [interface]\ndefault interface is en0\nexample: ip -c bridge0"; return ;;
    c) copy=true ;;
    ?) echo "error: option -$OPTARG is not implemented"; return ;;
    esac
        done
        shift $((OPTIND-1))
        local interface=${1-en0}
    local newline=$'\n'
        local command="ifconfig $interface | grep 'inet ' | cut -d ' ' -f2 | tr -d '\n'"
        if [ "$copy" = "true" ]
            then
                command=$command" | tee >(pbcopy)"
                fi
                execute $command
}

function execute() {
    printf '%s' "Executing: $1"
        echo '\n====================='
        eval $1
}



