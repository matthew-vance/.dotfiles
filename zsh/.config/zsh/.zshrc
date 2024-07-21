#!/usr/bin/env zsh

local antidote_dir=$HOME/.antidote
[[ -d $antidote_dir ]] ||
  git clone https://github.com/mattmc3/antidote $antidote_dir

source $antidote_dir/antidote.zsh
antidote load

# after compinit

eval "$(zoxide init zsh --cmd cd)"

[[ -e $HOME/.local.zsh ]] && source $HOME/.local.zsh
