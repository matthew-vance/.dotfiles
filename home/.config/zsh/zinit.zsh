#!/usr/bin/env zsh

# https://github.com/zdharma-continuum/zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# install zinit if not already installed
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# install plugins
zinit wait lucid for \
  davidde/git \
  Aloxaf/fzf-tab \
  blockf atpull"zinit creinstall -q ." \
    zsh-users/zsh-completions \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
