-- Neovide GUI configuration
if not vim.g.neovide then
  return {}
end

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          -- Font configuration
          neovide_font = "JetBrainsMono Nerd Font:h14",
          neovide_font_size = 14,
          neovide_linespace = 0,

          -- Transparency and blur
          neovide_transparency = 0.95,
          neovide_blur = true,
          neovide_window_blurred = true,

          -- Animations
          neovide_animation_length = 0.13,
          neovide_scroll_animation_length = 0.2,
          neovide_cursor_animation_length = 0.13,
          neovide_cursor_trail_size = 0.8,
          neovide_cursor_antialiasing = true,

          -- Visual effects
          neovide_cursor_vfx_mode = "railgun", -- Options: "", "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"
          neovide_cursor_vfx_opacity = 200.0,
          neovide_cursor_vfx_particle_density = 7.0,
          neovide_cursor_vfx_particle_speed = 10.0,
          neovide_cursor_vfx_particle_phase = 1.5,
          neovide_cursor_vfx_particle_curl = 1.0,

          -- Performance
          neovide_refresh_rate = 60,
          neovide_idle_refresh_rate = 5,
          neovide_no_idle = false,

          -- Window behavior
          neovide_confirm_quit = true,
          neovide_fullscreen = false,
          neovide_remember_window_size = true,
          neovide_hide_mouse_when_typing = false,

          -- macOS specific
          neovide_input_macos_alt_is_meta = true,
        },
      },
    },
  },
}