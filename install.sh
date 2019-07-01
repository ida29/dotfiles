#!/bin/bash
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.ctags ~/.ctags
mkdir -p ~/.vim
ln -sf ~/dotfiles/colors/ ~/.vim/
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
mkdir -p ~/.config/fish/functions
ln -sf ~/dotfiles/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
