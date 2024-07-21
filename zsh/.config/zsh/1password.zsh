#!/usr/bin/env zsh

eval "$(op completion zsh)"

# ssh agent
if [[ -f "$HOME/.agent-bridge.sh" ]]; then
    source "$HOME/.agent-bridge.sh"
fi
