#!/bin/bash
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ctags ~/.ctags
if [[ "$OSTYPE" != "msys" ]]; then
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
	mkdir -p ~/.config/fish/functions
	ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
	ln -sf ~/dotfiles/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
fi
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
