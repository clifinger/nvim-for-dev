---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ashes",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NvimTreeGitDirty = { fg = "grey_fg" },
    NvimTreeGitNew = { fg = "grey_fg" },
    NvimTreeGitDeleted = { fg = "grey_fg" },
    NvimTreeGitIgnored = { fg = "grey_fg" },
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
  -- cmp = { lspkind = false },
  -- lsp = { signature = { disabled = true } },
}

return M
