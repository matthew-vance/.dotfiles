#!/usr/bin/env zsh

# fnm
if [[ $OSTYPE == 'linux'* ]]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
fi

alias nvm="echo 'use fnm ya big, dumb, idiot'"
eval "$(fnm env --use-on-cd)"
