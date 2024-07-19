#!/usr/bin/env zsh

export HISTFILE=${XDG_DATA_HOME:=$HOME/.local/share}/zsh/history

[[ -d $HISTFILE:h ]] ||
    mkdir -p $HISTFILE:h

export SAVEHIST=$(( 100 * 1000 ))
export HISTFILESIZE=$SAVEHIST
export HISTSIZE=$(( 1.2 * SAVEHIST ))

export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath

path=(
    $path
    $HOME/.local/bin
)

fpath=(
    $ZDOTDIR/functions
    $fpath
    $HOME/.local/share/zsh/site-functions
)

# history
setopt HIST_FCNTL_LOCK
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt HIST_IGNORE_ALL_DUPS
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

setopt HASH_EXECUTABLES_ONLY
setopt NUMERIC_GLOB_SORT

unset zle_bracketed_paste

# Configure tab completion
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --oneline --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

() {
    local gitdir=$HOME/znap

    hash -d zsh=$ZDOTDIR
    hash -d git=$gitdir

    local file=
    # source local files
    for file in $ZDOTDIR/**/*.zsh; do
        . $file
    done

} "$@"
