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
- `starship` - shell prompt

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

Stow will symlink the contents of the directory, so the directory structure should mirror the stucture you want in the home directory. For example, the `zsh` directory contains the `.zshenv` file and other files in a `.config` directory. The `zsh` directory is symlinked to the home directory, so the `.zshenv` file will be symlinked to `~/.zshenv` and the `.config` directory and everything inside it will be recursivley symlinked to `~/.config`.

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

Run `./configure-git.sh` to set up the git config.

## fonts

[JetBrains Mono](https://www.jetbrains.com/lp/mono/) is the primary font. You need the vanilla version and [the nerd font version](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono).
