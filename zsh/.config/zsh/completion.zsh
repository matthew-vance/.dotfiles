#!/usr/bin/env zsh

ZSH_COMPDUMP=$HOME/.cache/zsh/zcompdump
autoload -Uz compinit && compinit -d $ZSH_COMPDUMP
