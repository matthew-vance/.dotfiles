#!/usr/bin/env zsh

export HISTFILE=$HOME/.zsh_history
export HISTFILESIZE=25000
export HISTSIZE=30000
export SAVEHIST=25000

if [[ $OSTYPE == 'linux'* ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:$HOME/go/bin
fi

# history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote


# TODO: auto source all files in the config dir
. ${ZDOTDIR}/aliases.zsh
. ${ZDOTDIR}/plugins.zsh
. ${ZDOTDIR}/fzf.zsh
. ${ZDOTDIR}/node.zsh

autoload -Uz promptinit && promptinit && prompt pure

unset zle_bracketed_paste

if [[ -f "$HOME/.agent-bridge.sh" ]]; then
  source "$HOME/.agent-bridge.sh"
fi