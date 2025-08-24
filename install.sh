#!/bin/bash
if [[ "$OSTYPE" != "msys" ]]; then
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ctags ~/.ctags
fi
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/fish/functions
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

# AstroNvim installation
# Backup existing Neovim config if it exists
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
    echo "Backing up existing Neovim configuration..."
    mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d_%H%M%S)
fi

# Clone AstroNvim
echo "Installing AstroNvim..."
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Also install vim-plug for Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git config --global core.editor 'vim -c "set fenc=utf-8"'
