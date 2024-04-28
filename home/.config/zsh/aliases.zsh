#!/usr/bin/env zsh

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."

alias cd..='cd ..'
alias -- -="cd -"
alias 1="cd -1"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"
alias 6="cd -6"
alias 7="cd -7"
alias 8="cd -8"
alias 9="cd -9"


alias copy="pbcopy"
alias paste="pbpaste"

alias a="alias | fzf --border --height 50% | rg -o '^[^=]+' | copy"
alias c="clear"

alias vim="nvim"

alias h="history"
alias h1="history -10"
alias h2="history -20"
alias h3="history -30"
alias hs="history | fzf --border --height 50% | copy"

alias ip="curl -s https://icanhazip.com; echo"

alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh'
alias sl="ls"

alias lg="lazygit"
alias lzd="lazydocker"

alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias uuidc="uuid | copy"

alias ff="rg --files -uu -g \"!.git\" | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

alias so="source ${ZDOTDIR}/.zshrc"

alias path="echo \"${PATH}\" | tr ':' '\n'"
alias spath="path | fzf --border --height 50% | copy"

alias ping="ping -c 5"

alias now='date +"%T"'

alias tf="terraform"
alias k="kubectl"

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# What's running on this port?
rop() {
    lsof -i -P | rg LISTEN | rg :$1
}
