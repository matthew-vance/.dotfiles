#!/usr/bin/env zsh

# https://github.com/pyenv/pyenv

if command -v pyenv &> /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
