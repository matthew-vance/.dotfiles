#!/usr/bin/env zsh

# https://brew.sh

znap eval brew-shellenv '/opt/homebrew/bin/brew shellenv'
fpath+=(
    $HOMEBREW_PREFIX/share/zsh/site-functions
)
alias bupa="brew update && brew upgrade && brew cleanup && brew doctor"
