return {
  {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim", -- For terminal support
    },
    cmd = {
      "ClaudeCode",
      "ClaudeCodeSend",
      "ClaudeCodeDiffAccept",
      "ClaudeCodeDiffDeny",
    },
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<leader>cs", mode = "v", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection to Claude" },
      { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
      { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
    },
    config = function()
      require("claudecode").setup({
        -- Terminal configuration
        terminal = {
          position = "float", -- "float", "right", "bottom"
          width = 0.8, -- For float position
          height = 0.8, -- For float position
        },
      })
    end,
  },
}