#!/usr/bin/env zsh

[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

[[ -e ${ZDOTDIR:-~}/.local.zsh ]] && source ${ZDOTDIR:-~}/.local.zsh

autoload -Uz compinit && compinit

eval "$(zoxide init zsh --cmd cd)" # must come after compinit
