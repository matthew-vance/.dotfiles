#!/usr/bin/env zsh

local antidote_dir=$HOME/.antidote
[[ -d $antidote_dir ]] ||
  git clone https://github.com/mattmc3/antidote $antidote_dir

source $antidote_dir/antidote.zsh
antidote load

[[ -e $HOME/.local.zsh ]] && source $HOME/.local.zsh

ZSH_COMPDUMP=$HOME/.cache/zsh/zcompdump
autoload -Uz compinit && compinit -d $ZSH_COMPDUMP

eval "$(zoxide init zsh --cmd cd)" # must come after compinit
