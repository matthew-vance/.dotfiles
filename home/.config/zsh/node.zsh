#!/usr/bin/env zsh

if command -v fnm &> /dev/null; then
  alias nvm="echo 'use fnm ya big, dumb, idiot'"
  eval "$(fnm env --use-on-cd)"
else
  echo "fnm not found"
fi
