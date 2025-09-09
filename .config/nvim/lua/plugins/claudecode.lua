return {
  {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim", -- For terminal support
    },
    lazy = false, -- Load immediately to ensure proper setup
    cmd = {
      "ClaudeCode",
      "ClaudeCodeSend",
      "ClaudeCodeDiffAccept",
      "ClaudeCodeDiffDeny",
      "ClaudeCodeFocus",
    },
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
      { "<leader>cs", mode = "v", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection to Claude" },
      { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
      { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
    },
    config = function()
      -- Check if Claude Code CLI is installed
      local claude_installed = vim.fn.executable("claude") == 1
      if not claude_installed then
        vim.notify(
          "Claude Code CLI not found! Please install it first:\ncurl -fsSL https://cli.claude.ai/install.sh | sh",
          vim.log.levels.WARN
        )
      end
      
      require("claudecode").setup({
        -- Terminal configuration
        terminal = {
          position = "float", -- "float", "right", "bottom"
          width = 0.8, -- For float position
          height = 0.8, -- For float position
        },
        -- Auto-start server on Neovim launch
        auto_start = true,
      })
    end,
  },
}