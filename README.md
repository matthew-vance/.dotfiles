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
- `git-delta` - `git` diff viewer

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

## zsh

### Local config

A `.local.zsh` file can be placed in the `zsh` directory to add local shell config.

### Plugin management

Plugins are managed with [Antidote](https://getantidote.github.io/). The `antidote` command is available in the shell.

To update plugins and the plugin manager, run:

```sh
antidote update
```

## git

I'm too lazy to figure out dealing with .gitconfig files on multiple machines, so just take the contents of the `dot-gitconfig` file and add it to your global git config.
