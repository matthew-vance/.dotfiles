#!/usr/bin/env zsh

# https://getantidote.github.io/
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

source ${ZDOTDIR}/.zsh_plugins.zsh
