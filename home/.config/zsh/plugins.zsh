#!/usr/bin/env zsh

ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
if [[ -d $ZFUNCDIR ]]; then
  fpath=($ZFUNCDIR $fpath)
  autoload -Uz $fpath[1]/*(.:t)
fi

[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# https://getantidote.github.io/
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

source ${ZDOTDIR}/.zsh_plugins.zsh
