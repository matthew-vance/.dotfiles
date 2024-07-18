#!/usr/bin/env zsh

# https://brew.sh

eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
alias bupa="brew update && brew upgrade && brew cleanup && brew doctor"
