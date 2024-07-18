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

unset zle_bracketed_paste

# Configure tab completion
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --oneline --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

# source local files
for file in $ZDOTDIR/*.zsh; do
    source "$file"
done

# init prompt - https://starship.rs/
eval "$(starship init zsh)"

# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh --cmd cd)"
