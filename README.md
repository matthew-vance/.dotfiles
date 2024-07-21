# dotfiles

`stow` is used to manage the symlinks. It is available in most package managers.
This whole thing basically works by mirroring the layout of the home directory and symlinking all of the files.

## Requirements

- `stow` - symlink manager
- `git` - version control
- `brew` - package manager
- `fzf` - fuzzy finder
- `ripgrep` - faster `grep` alternative
- `bat` - `cat` alternative with syntax highlighting
- `eza` - fast `ls` alternative
- `zoxide` - smart `cd` alternative

## Optional

- `fnm` if using node
- `pyenv` if using python
- `rbenv` if using ruby
- `lazygit`
- `lazydocker`

## Usage

Clone the repo into the home directory.

```sh
git clone git@github.com:matthew-vance/dotfiles.git ~/dotfiles
```

Use `stow` to symlink the config files for the desired application.

```sh
cd ~/dotfiles
stow zsh
```

## Local zsh config

A `.local.zsh` file can be placed in the `zsh` directory to add local shell config.
