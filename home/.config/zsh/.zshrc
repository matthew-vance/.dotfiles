#!/usr/bin/env zsh

export HISTFILE=$HOME/.zsh_history
export HISTFILESIZE=25000
export HISTSIZE=30000
export SAVEHIST=25000

export PATH="$HOME/.local/bin:$PATH"



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

# plugins
. ${ZDOTDIR}/plugins.zsh

if command -v brew &> /dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

if command -v aws &> /dev/null 2>&1; then
  complete -C '/usr/local/bin/aws_completer' aws
fi

autoload -U promptinit; promptinit
prompt pure

unset zle_bracketed_paste

if [[ -f "$ZDOTDIR/local.zsh" ]]; then
    source "$ZDOTDIR/local.zsh"
fi