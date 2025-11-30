local config = require "nvchad.configs.nvimtree"

config.renderer = config.renderer or {}
config.renderer.icons = config.renderer.icons or {}
config.renderer.icons.glyphs = config.renderer.icons.glyphs or {}
config.renderer.icons.glyphs.git = {
  unstaged = "●",
  staged = "✓",
  unmerged = "",
  renamed = "➜",
  untracked = "★",
  deleted = "",
  ignored = "◌",
}

return config
