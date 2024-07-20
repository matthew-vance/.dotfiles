# dotfiles

`stow` is used to manage the symlinks. It is available in most package managers.
This whole thing basically works by mirroring the layout of the home directory and symlinking all of the files.

## Requirements

- `stow` - symlink manager
- `git` - version control
- `make` - install scripts
- `zsh` - shell
- `brew` - package manager
- `neovim` - text editor
- `fzf` - fuzzy finder
- `ripgrep` - faster `grep` alternative
- `bat` - `cat` alternative with syntax highlighting
- `eza` - fast `ls` alternative
- `kitty` - terminal emulator
- `zoxide` - smart `cd` alternative

## Optional

- `fnm` if using node
- `pyenv` if using python
- `rbenv` if using ruby
- `lazygit`
- `lazydocker`

## Usage

```sh
make install
```

```sh
make uninstall
```

## Local config

A `.local.zsh` file can be placed in the `zsh` directory to add local shell config.
