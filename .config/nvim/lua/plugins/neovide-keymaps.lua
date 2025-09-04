-- Neovide-specific keymappings
if not vim.g.neovide then
  return {}
end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- Normal mode
        n = {
          -- Font size adjustments
          ["<C-=>"] = {
            function()
              vim.g.neovide_font_size = vim.g.neovide_font_size + 1
              vim.cmd("redraw")
            end,
            desc = "Increase Neovide font size",
          },
          ["<C-->"] = {
            function()
              vim.g.neovide_font_size = vim.g.neovide_font_size - 1
              vim.cmd("redraw")
            end,
            desc = "Decrease Neovide font size",
          },
          ["<C-0>"] = {
            function()
              vim.g.neovide_font_size = 14
              vim.cmd("redraw")
            end,
            desc = "Reset Neovide font size",
          },

          -- Fullscreen toggle
          ["<F11>"] = {
            function()
              vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
            end,
            desc = "Toggle Neovide fullscreen",
          },

          -- Transparency adjustments
          ["<leader>ut"] = {
            function()
              local transparency = vim.g.neovide_transparency or 0.95
              if transparency < 1.0 then
                vim.g.neovide_transparency = transparency + 0.05
              else
                vim.g.neovide_transparency = 1.0
              end
              vim.cmd("redraw")
            end,
            desc = "Increase Neovide transparency",
          },
          ["<leader>uT"] = {
            function()
              local transparency = vim.g.neovide_transparency or 0.95
              if transparency > 0.1 then
                vim.g.neovide_transparency = transparency - 0.05
              else
                vim.g.neovide_transparency = 0.1
              end
              vim.cmd("redraw")
            end,
            desc = "Decrease Neovide transparency",
          },

          -- Cursor effects cycle
          ["<leader>uc"] = {
            function()
              local effects = { "", "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe" }
              local current = vim.g.neovide_cursor_vfx_mode or ""
              local current_index = 1
              for i, effect in ipairs(effects) do
                if effect == current then
                  current_index = i
                  break
                end
              end
              local next_index = current_index % #effects + 1
              vim.g.neovide_cursor_vfx_mode = effects[next_index]
              vim.notify("Cursor effect: " .. effects[next_index], vim.log.levels.INFO)
            end,
            desc = "Cycle Neovide cursor effects",
          },
        },

        -- Insert mode (for macOS clipboard support)
        i = {
          ["<D-v>"] = { "<C-r>+", desc = "Paste from clipboard" },
        },

        -- Visual mode
        v = {
          ["<D-c>"] = { '"+y', desc = "Copy to clipboard" },
          ["<D-v>"] = { '"+p', desc = "Paste from clipboard" },
        },

        -- Command mode
        c = {
          ["<D-v>"] = { "<C-r>+", desc = "Paste from clipboard" },
        },
      },
    },
  },
}