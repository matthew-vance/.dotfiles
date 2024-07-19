#!/usr/bin/env zsh

# https://brew.sh

fpath+=(
    $HOMEBREW_PREFIX/share/zsh/site-functions
)
alias bupa="brew update && brew upgrade && brew cleanup && brew doctor"
