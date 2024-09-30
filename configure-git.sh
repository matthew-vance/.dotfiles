#!/usr/bin/env sh

stow delta

git config --global include.path "~/.config/delta/delta.gitconfig"

git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only --features=interactive"
