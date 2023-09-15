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

if [[ $OSTYPE == 'linux'* ]]; then
  alias copy='xclip -selection clipboard'
  alias paste='xclip -o -selection clipboard'
else
  alias copy="pbcopy"
  alias paste="pbpaste"
fi

alias a="alias | fzf --border --height 50% | rg -o '^[^=]+' | copy"
alias c="clear"

alias vim="nvim"

alias h="history"
alias h1="history -10"
alias h2="history -20"
alias h3="history -30"
alias hs="history | fzf --border --height 50% | copy"

alias ip="curl -s https://icanhazip.com; echo"
alias ls="exa"
alias l="ls"
alias la="l --all --header"
alias ll="l --all --header --long"

alias lg="lazygit"

alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias uuidc="uuid | copy"

alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias s="search"
alias so="source ${ZDOTDIR}/.zshrc"

alias t="tmux"
alias to="tmux new -s"
alias ta="tmux a"
alias t1="tmux a -t 1"
alias t2="tmux a -t 2"
alias t3="tmux a -t 3"
alias t4="tmux a -t 4"
alias tk="tmux kill-session -t"
alias tka="tmux kill-session -a"
alias tl="tmux ls"

alias path="echo \"${PATH}\" | tr ':' '\n'"
alias spath="path | fzf --border --height 50% | copy"

# What's running on this port?
rop() {
  lsof -i -P | rg LISTEN | rg :$1
}
