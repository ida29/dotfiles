# Claude Code Neovim Setup Guide

## Prerequisites

1. **Install Claude Code CLI** (required on each machine):
   ```bash
   curl -fsSL https://cli.claude.ai/install.sh | sh
   ```

2. **Login to Claude Code** (once per machine):
   ```bash
   claude login
   ```

## Installation Steps

1. **Clone dotfiles** (if not already done):
   ```bash
   git clone https://github.com/ida29/dotfiles.git
   cd dotfiles
   ./install.sh
   ```

2. **Open Neovim and install/update plugins**:
   ```vim
   :Lazy sync
   ```

3. **Verify installation**:
   - Open Neovim
   - Press `<leader>cc` (usually `\cc`) to toggle Claude Code
   - If you see an error about Claude Code CLI not found, install it using step 1 above

## Troubleshooting

### Plugin not loading
- Run `:Lazy` in Neovim to check if `coder/claudecode.nvim` is installed
- Check for errors with `:checkhealth claudecode`

### Claude Code CLI not working
- Verify installation: `which claude`
- Check version: `claude --version`
- Re-login if needed: `claude login`

### WebSocket connection issues
- The plugin creates a WebSocket server that Claude Code CLI connects to
- Check if port is available (default: 11111)
- Restart Neovim if connection fails

## Key Mappings

- `<leader>cc` - Toggle Claude Code terminal
- `<leader>cf` - Focus Claude Code window
- `<leader>cs` - Send visual selection to Claude
- `<leader>ca` - Accept Claude's diff suggestion
- `<leader>cd` - Deny Claude's diff suggestion

## Notes

- The plugin uses `folke/snacks.nvim` for terminal management
- Configuration is in `.config/nvim/lua/plugins/claudecode.lua`
- The plugin auto-starts the WebSocket server on Neovim launch