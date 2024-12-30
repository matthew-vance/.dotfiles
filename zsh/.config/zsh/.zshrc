#!/usr/bin/env zsh

local antidote_dir=$HOME/.antidote
[[ -d $antidote_dir ]] ||
  git clone https://github.com/mattmc3/antidote $antidote_dir

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

source $antidote_dir/antidote.zsh
antidote load

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# after compinit

eval "$(zoxide init zsh --cmd cd)"
eval "$(starship init zsh)"

[[ -e $HOME/.local.zsh ]] && source $HOME/.local.zsh

source "$HOME/.sdkman/bin/sdkman-init.sh"
