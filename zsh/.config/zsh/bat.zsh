#!/usr/bin/env zsh

alias rcat="$(which cat)"
alias cat="bat"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
