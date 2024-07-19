#!/usr/bin/env zsh

# https://rbenv.org/

if command -v rbenv &> /dev/null; then
  znap eval rbenv 'rbenv init - zsh'
fi
