#!/usr/bin/env zsh

# https://github.com/marlonrichert/zsh-snap

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

znap eval starship 'starship init zsh'
znap prompt

znap eval zoxide 'zoxide init zsh --cmd cd'

# install and load plugins
znap source zsh-users/zsh-autosuggestions
znap source zdharma-continuum/fast-syntax-highlighting
znap source davidde/git
znap source Aloxaf/fzf-tab

znap install zsh-users/zsh-completions
