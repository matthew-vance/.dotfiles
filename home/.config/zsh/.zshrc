#!/usr/bin/env zsh

# TODO: auto source all files in the config dir
. ${ZDOTDIR}/aliases.zsh
. ${ZDOTDIR}/plugins.zsh
. ${ZDOTDIR}/fzf.zsh
. ${ZDOTDIR}/node.zsh

autoload -U promptinit; promptinit
prompt pure

unset zle_bracketed_paste
