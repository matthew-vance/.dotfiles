#!/usr/bin/env zsh

# https://github.com/marlonrichert/zsh-snap

local znap=~git/zsh-snap/znap.zsh

# Auto-install Znap if it's not there yet.
if ! [[ -r $znap ]]; then   # Check if the file exists and can be read.
  mkdir -p ~git
  git -C ~git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git
fi

. $znap   # Load Znap.

znap eval starship 'starship init zsh'
znap prompt

znap eval brew-shellenv '/opt/homebrew/bin/brew shellenv'
znap eval zoxide 'zoxide init zsh --cmd cd'

# install and load plugins
local -a plugins=(
  zsh-users/zsh-autosuggestions
  zdharma-continuum/fast-syntax-highlighting
  davidde/git
  Aloxaf/fzf-tab
)

znap clone $plugins

local p=
for p in $plugins; do
  znap source $p
done

znap install zsh-users/zsh-completions
