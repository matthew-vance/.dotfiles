#!/usr/bin/env zsh

# https://github.com/mattmc3/zsh_unplugged

ZPLUGINDIR=${HOME}/zsh/plugins

# Clone zsh_unplugged and use it as a micro plugin manager.
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

plugins=(
  #regular
  sindresorhus/pure
  zsh-users/zsh-completions
  rupa/z
  davidde/git

  # deferred
  romkatv/zsh-defer
  zdharma/fast-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
)

plugin-load $plugins
