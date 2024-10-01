#!/usr/bin/env sh

stow delta

git config --global include.path "~/.config/delta/delta.gitconfig"

git config --global core.pager "delta --line-numbers"
git config --global interactive.diffFilter "delta --color-only --features=interactive"
git config --global diff.colorMoved default
git config --global push.autoSetupRemote true
git config --global init.defaultBranch main
git config --global pull.rebase false
