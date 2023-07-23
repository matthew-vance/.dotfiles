#!/usr/bin/env zsh

# TODO: auto source all files in the config dir
[[ -f ${ZDOTDIR:-~}/aliases.zsh ]] && . ${ZDOTDIR:-~}/aliases.zsh
[[ -f ${ZDOTDIR:-~}/plugins.zsh ]] && . ${ZDOTDIR:-~}/plugins.zsh
[[ -f ${ZDOTDIR:-~}/fzf.zsh ]] && . ${ZDOTDIR:-~}/fzf.zsh
[[ -f ${ZDOTDIR:-~}/node.zsh ]] && . ${ZDOTDIR:-~}/node.zsh

autoload -U promptinit; promptinit
prompt pure
