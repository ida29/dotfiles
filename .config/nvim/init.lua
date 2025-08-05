-- 基本オプション
local set = vim.opt

set.fileencodings = { "utf-8", "iso-2022-jp", "euc-jp", "sjis", "cp932" }
set.fileformats = { "unix", "dos", "mac" }
set.number = true
set.tabstop = 4
set.shiftwidth = 4
set.backspace = "indent,eol,start"
set.cindent = true
set.title = true
set.showmatch = true
set.cursorline = true
set.swapfile = false
set.autoread = true
set.ruler = true
set.hidden = true
set.history = 100
set.showcmd = true
set.incsearch = true
set.hlsearch = true
set.wrap = false
set.wrapscan = true
set.ignorecase = true
set.smartcase = true
set.wildmenu = true
set.listchars = { tab = "> ", eol = "<" }
set.list = true
set.clipboard = "unnamedplus"
set.re = 0
set.spelllang = { "en", "cjk" }
set.termguicolors = true
set.background = "dark"

-- キーマップ
local map = vim.keymap.set
map("i", "<C-c>", "<Esc>")
map("n", "p", '"0p')
map("n", "P", '"0P')
map("n", "Y", "y$")
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "gj", "j")
map("n", "gk", "k")
map("n", "<Space>h", "0")
map("n", "<Space>j", "]]zz")
map("n", "<Space>k", "[[zz")
map("n", "<Space>l", "$")
map("v", "j", "gj")
map("v", "k", "gk")
map("v", "gj", "j")
map("v", "gk", "k")
vim.cmd([[cmap w!! w !sudo tee > /dev/null %]])

-- diff mode
if vim.wo.diff then
  set.splitright = true
  map("n", "<Space><Space>", "]czz")
end

-- Autocmd
local group = vim.api.nvim_create_augroup("guard", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = group,
  pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.py", "*.json" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = group,
  pattern = { "*.vue", "*.rb", "*.erb", "*.html", "*.scss", "*.css", "*.js", "*.ts", "*.tsx", "*.coffee" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  { "fatih/vim-go" },
  { "mattn/emmet-vim" },
  { "pearofducks/ansible-vim" },
  { "jparise/vim-graphql" },
  { "ConradIrwin/vim-bracketed-paste" },
  { "majutsushi/tagbar" },
  { "junegunn/vim-easy-align" },
  { "vim-airline/vim-airline" },
  { "tpope/vim-fugitive" },
  { "w0ng/vim-hybrid" },
  { "prabirshrestha/asyncomplete.vim" },
  { "nicwest/vim-camelsnek" },
  { "will133/vim-dirdiff" },
  { "editorconfig/editorconfig-vim" },
  { "tpope/vim-endwise" },
  { "tpope/vim-rails" },
  { "github/copilot.vim" },

  -- LSP 関連
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },

  -- Nvim-tree (ファイラー)
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Git diff 関連
  { "sindrets/diffview.nvim" },
  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
})

-- Colorscheme
vim.cmd("colorscheme hybrid")

-- ===== LSP 設定 =====
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local util = require("lspconfig.util")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "ts_ls",       -- Next.js/React
    "eslint",      -- Lint
    "tailwindcss", -- Tailwind + PandaCSS
    "volar",       -- Vue
    "solargraph",  -- Ruby
    "gopls",       -- Go
    "lua_ls",      -- Lua
  },
})

-- 共通 on_attach
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  local map = vim.keymap.set
  map("n", "<Space>d", require("telescope.builtin").lsp_definitions, opts)
  map("n", "<Space>i", require("telescope.builtin").lsp_implementations, opts)
  map("n", "<Space>c", require("telescope.builtin").lsp_references, opts)
  map("n", "<Space>t", require("telescope.builtin").lsp_type_definitions, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- TS/JS
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
  settings = {
    typescript = { format = { enable = false } },
    javascript = { format = { enable = false } },
  },
})

-- ESLint
lspconfig.eslint.setup({
  on_attach = on_attach,
})

-- TailwindCSS
lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
})

-- Go
lspconfig.gopls.setup({
  on_attach = on_attach,
})

-- Lua
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } },
  },
})

-- Telescope 設定
local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
map("n", "<Space>m", builtin.oldfiles, { desc = "Recently opened files" })
map("n", "<Space>f", builtin.find_files, { desc = "Find files" })
map("n", "<Space>g", function()
  builtin.live_grep({ default_text = vim.fn.expand("<cword>") })
end, { desc = "Live grep word under cursor" })
map("n", "<Space>b", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>gs", builtin.git_status, { desc = "Git status (changed files)" }) -- ★ 追加

-- Nvim-tree 設定 (ファイラー)
require("nvim-tree").setup({})
map("n", "<Space>e", ":NvimTreeToggle<CR>", { desc = "File Explorer" })
vim.keymap.set("n", "<Space>n", ":NvimTreeFindFile<CR>", { desc = "Reveal current file in NvimTree" })

-- Diffview
vim.keymap.set("n", "<Space>d", ":DiffviewOpen<CR>", { desc = "Diffview open (HEAD)" })
vim.keymap.set("n", "<Space>h", ":DiffviewFileHistory %<CR>", { desc = "File history" })

-- Git blame
vim.keymap.set("n", "<Space>b", ":Git blame<CR>", { desc = "Git blame" })

-- Gitsigns 設定
require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
  },
  current_line_blame = true,
})

-- Plugin-specific mappings
map("n", "<Space>w", ":TagbarToggle<CR>")
map("n", "<Space>B", ":Git blame<CR>")

-- 現在ファイルの絶対パスをコピー
vim.keymap.set("n", "<Space>y", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  print("Copied: " .. vim.fn.expand("%:p"))
end, { desc = "Copy file path" })
