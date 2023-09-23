#!/usr/bin/env zsh

if [[ $OSTYPE == 'linux'* ]]; then
  if [[ -f /etc/redhat-release ]]; then
    source /usr/share/fzf/shell/key-bindings.zsh
  elif [[ -f /etc/debian_version ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
  fi
elif [[ $OSTYPE == 'darwin'* ]]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'batcat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | copy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh