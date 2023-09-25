#!/usr/bin/env zsh

if command -v rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
else
  echo "rbenv not found"
fi
