#!/usr/bin/env zsh

config_history() {
    HISTFILE=${XDG_DATA_HOME:=$HOME/.local/share}/zsh/history

    [[ -d $HISTFILE:h ]] ||
        mkdir -p $HISTFILE:h

    SAVEHIST=$(( 100 * 1000 ))
    HISTFILESIZE=$(( 1.2 * SAVEHIST ))
    HISTSIZE=$(( 1.2 * SAVEHIST ))
}

set_options() {
    setopt NO_CLOBBER
    setopt INTERACTIVE_COMMENTS
    setopt HASH_EXECUTABLES_ONLY
    setopt NUMERIC_GLOB_SORT

    # directory
    setopt AUTO_CD
    setopt AUTO_PUSHD
    setopt PUSHD_IGNORE_DUPS
    setopt PUSHD_MINUS

    # history
    setopt HIST_FCNTL_LOCK
    setopt INC_APPEND_HISTORY
    setopt EXTENDED_HISTORY
    setopt HIST_EXPIRE_DUPS_FIRST
    setopt HIST_FIND_NO_DUPS
    setopt HIST_IGNORE_ALL_DUPS
    setopt HIST_IGNORE_DUPS
    setopt HIST_IGNORE_SPACE
    setopt HIST_SAVE_NO_DUPS
    setopt HIST_VERIFY
    setopt SHARE_HISTORY
}

init_znap() {
    local znap_dir=$HOME/znap/zsh-snap
    local znap=$znap_dir/znap.zsh

    if ! [[ -r $znap ]]; then
        git clone --depth 1 -- \
            https://github.com/marlonrichert/zsh-snap.git $znap_dir
    fi

    source $znap   # Load Znap.
}

config_env() {
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
}

config_prompt() {
    znap prompt sindresorhus/pure
}

config_plugins() {
    local -a plugins=(
        zsh-users/zsh-autosuggestions
        zdharma-continuum/fast-syntax-highlighting
        davidde/git
    )

    for p in $plugins; do
        znap source $p
    done

    znap install zsh-users/zsh-completions
}

set_aliases() {
    alias -g ...="../.."
    alias -g ....="../../.."
    alias -g .....="../../../.."
    alias -g ......="../../../../.."

    alias cd..='cd ..'
    alias -- -="cd -"
    alias 1="cd -1"
    alias 2="cd -2"
    alias 3="cd -3"
    alias 4="cd -4"
    alias 5="cd -5"
    alias 6="cd -6"
    alias 7="cd -7"
    alias 8="cd -8"
    alias 9="cd -9"

    alias h="history"
    alias h1="history -10"
    alias h2="history -20"
    alias h3="history -30"
    alias hs="history | fzf --border --height 50% | copy"

    alias copy="pbcopy"
    alias paste="pbpaste"

    alias a="alias | fzf --border --height 50% | rg -o '^[^=]+' | copy"
    alias c="clear"

    alias vim="nvim"

    alias ip="curl -s https://icanhazip.com; echo"

    alias ls='eza --color=auto'
    alias la='ls --all'
    alias ll='ls --all --long --header --classify=auto'
    alias sl="ls"

    alias lg="lazygit"
    alias lzd="lazydocker"

    alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
    alias uuidc="uuid | copy"

    alias ff="rg --files -uu -g \"!.git\" | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"

    alias so="source ${ZDOTDIR}/.zshrc"

    alias path="echo \"${PATH}\" | tr ':' '\n'"
    alias spath="path | fzf --border --height 50% | copy"

    alias ping="ping -c 5"

    alias now='date +"%T"'

    alias tf="terraform"
    alias k="kubectl"

    [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

    # What's running on this port?
    rop() {
        lsof -i -P | rg LISTEN | rg :$1
    }
}

config_tools() {
    znap eval zoxide 'zoxide init zsh --cmd cd'

    for t in $ZDOTDIR/tool_configs/**/*.zsh; do
        source $t
    done
}

config_local() {
    local file=$ZDOTDIR/local.zsh

    if  [[ -r $file ]]; then
        source $file
    fi
}

config_env
config_history
set_aliases
set_options
init_znap
config_prompt
config_plugins
config_tools
config_local
