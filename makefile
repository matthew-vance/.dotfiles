.PHONY: help install uninstall
.DEFAULT_GOAL := help

install:
	stow --verbose --ignore='.DS_Store' --target=$$HOME home

uninstall:
	stow -D --verbose --ignore='.DS_Store' --target=$$HOME home

help:
	@echo "help"
	@echo "    shows this message"
	@echo ""
	@echo "install"
	@echo "    symlink the dotfiles"
	@echo ""
	@echo "uninstall"
	@echo "    unsymlink the dotfiles"