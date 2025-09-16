return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      position = "left",
      width = 30,
    },
  },
  init = function()
    -- Open Neo-tree on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("neo-tree.command").execute({ action = "show" })
      end,
      desc = "Open Neo-tree on startup",
    })
  end,
}