.PHONY: help install uninstall
.DEFAULT_GOAL := help

install:
	stow --verbose --ignore='.DS_Store' --target=$$HOME home
	stow --verbose --ignore='.DS_Store' --target=$$HOME/.config config

uninstall:
	stow -D --verbose --ignore='.DS_Store' --target=$$HOME home
	stow -D --verbose --ignore='.DS_Store' --target=$$HOME/.config config

help:
	@echo "help"
	@echo "    shows this message"
	@echo ""
	@echo "install"
	@echo "    symlink the dotfiles"
	@echo ""
	@echo "uninstall"
	@echo "    unsymlink the dotfiles"