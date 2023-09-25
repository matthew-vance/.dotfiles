#!/usr/bin/env zsh

if command -v pyenv &> /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
else
  echo "pyenv not found"
fi