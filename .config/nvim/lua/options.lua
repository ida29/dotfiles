-- Neovim options
vim.opt.relativenumber = false
vim.opt.number = true

-- Disable asyncomplete completely
vim.g.asyncomplete_auto_popup = 0
vim.g.asyncomplete_tab_enable = 0

-- Disable built-in completion menu if it appears
vim.opt.completeopt = "menu,menuone,noselect"

-- Clipboard settings
vim.opt.clipboard = "unnamedplus"

-- Map Ctrl-c to Escape in insert mode
vim.keymap.set('i', '<C-c>', '<Esc>', { noremap = true })
