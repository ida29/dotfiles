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
# Only install AstroNvim if it doesn't exist
if [ ! -d ~/.config/nvim ]; then
    echo "Installing AstroNvim..."
    git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
    rm -rf ~/.config/nvim/.git
else
    echo "AstroNvim already installed, skipping installation..."
fi

# Copy custom plugin configurations
echo "Copying custom plugin configurations..."
mkdir -p ~/.config/nvim/lua/plugins

# Create symlinks for all custom plugins
for plugin in ~/dotfiles/.config/nvim/lua/plugins/*.lua; do
    if [ -f "$plugin" ]; then
        plugin_name=$(basename "$plugin")
        ln -sf "$plugin" ~/.config/nvim/lua/plugins/"$plugin_name"
        echo "Linked $plugin_name"
    fi
done

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Also install vim-plug for Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ~/.tmux/plugins/tpm を最新化するスクリプト
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "TPM not found. Cloning..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM already exists. Updating..."
  cd ~/.tmux/plugins/tpm && git pull origin master
fi

git config --global core.editor 'vim -c "set fenc=utf-8"'
