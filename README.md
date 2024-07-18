# dotfiles

`stow` is used to manage the symlinks. It is available in most package managers.
This whole thing basically works by mirroring the layout of the home directory and symlinking all of the files.

## Requirements

- `stow`
- `git`
- `make`
- `zsh`
- `brew`
- `neovim`
- `fzf`
- `ripgrep`
- `bat`
- `kitty`
- `starship`
- `zoxide`

## Optional

- `fnm` if using node
- `pyenv` if using python
- `rbenv` if using ruby

## Usage

```sh
make install
```

```sh
make uninstall
```

## Local config

A `local.zsh` file can be placed in the `zsh` directory to add local shell config.
