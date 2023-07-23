#!/usr/bin/env zsh

alias a="alias | fzf --border --height 50% | rg -o '^[^=]+' | copy"
alias c="clear"
alias copy="pbcopy"
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
alias lzd="lazydocker"
alias paste="pbpaste"
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias uuidc="uuid | copy"
alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
alias s="search"
alias so="source ${ZDOTDIR}/.zshrc"
alias t="tmux"
alias ta="tmux a"
alias t1="tmux a -t 1"
alias t2="tmux a -t 2"
alias t3="tmux a -t 3"
alias t4="tmux a -t 4"
alias tk="tmux kill-session -t"
alias tka="tmux kill-session -a"
alias tl="tmux ls"

eval $(thefuck --alias)

# What's running on this port?
rop() {
  lsof -i -P | rg LISTEN | rg :$1
}
