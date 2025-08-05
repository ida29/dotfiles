# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for various development tools. The configurations are optimized for modern web development with support for multiple languages and frameworks. Both Vim and Neovim are supported with a shared configuration.

## Installation & Setup Commands

**Initial Setup:**
```bash
# Clone and install (Unix/Linux/macOS)
git clone https://github.com/ida29/dotfiles.git
cd dotfiles
./install.sh

# Windows setup
install.bat
```

**Post-Installation Commands:**
```bash
# Install Vim plugins (run inside Vim)
:PlugInstall

# Install Neovim plugins (run inside Neovim)
:PlugInstall

# Install Fish plugins (run in Fish shell)
fisher install <plugin-name>

# Reload tmux configuration (inside tmux)
Ctrl-a r
```

## Architecture & Key Components

**Core Configuration Files:**
- `.vimrc`: Extensive Vim setup with vim-plug plugin manager, COC LSP integration, and GitHub Copilot
- `.config/nvim/init.lua`: Standalone Neovim configuration with Lazy.nvim plugin manager
- `.config/nvim/lazy-lock.json`: Lazy.nvim plugin lock file for consistent plugin versions
- `fish/config.fish`: Fish shell with Volta (Node.js version manager) and Starship prompt
- `.tmux.conf`: Terminal multiplexer with custom keybindings (Ctrl-a prefix)
- `.ctags`: Go language support for code navigation

**Development Stack:**
- **Frontend**: Vue.js, JavaScript, HTML, CSS/SCSS with 2-space indentation
- **Backend**: Go, PHP, Ruby, Python with 4-space indentation
- **Tools**: COC for LSP, GitHub Copilot for AI assistance, ctags for navigation

**Key Vim Plugins:**
- `neoclide/coc.nvim`: Language Server Protocol support
- `github/copilot.vim`: AI code assistance
- `fatih/vim-go`: Go development
- `posva/vim-vue`: Vue.js support
- Multiple language-specific plugins for Ruby, PHP, GraphQL, Ansible

**COC Extensions** (managed via `:CocInstall`):
- coc-go, coc-vue, coc-phpls, coc-solargraph (Ruby)
- coc-pyright, coc-vetur, coc-prettier

## Common Development Workflows

**Language-Specific Commands:**
- Go: `:GoRun`, `:GoBuild`, `:GoTest` (vim-go commands)
- Vue/JS: COC provides auto-formatting and linting
- Git: Use fugitive plugin (`:Git` commands in Vim)

**Key Mappings:**
- Leader key: `\`
- COC navigation: `gd` (definition), `gy` (type definition), `gi` (implementation)
- Tab completion in Vim
- Ctrl-a as tmux prefix (instead of default Ctrl-b)

**File Type Detection:**
The setup automatically configures indentation based on file type:
- 2 spaces: `.vue`, `.rb`, `.erb`, `.html`, `.scss`, `.css`, `.js`, `.coffee`
- 4 spaces: `.c`, `.h`, `.cpp`, `.hpp`, `.py`, `.php`, `.json`

## Vim/Neovim Configuration

Vim and Neovim have separate, independent configurations:
- **Vim**: Uses `.vimrc` with vim-plug plugin manager
- **Neovim**: Uses `.config/nvim/init.lua` with Lazy.nvim plugin manager
- **Installation**: The install script sets up both configurations independently
- **Features**: Both editors have similar keybindings and settings but use different plugin ecosystems