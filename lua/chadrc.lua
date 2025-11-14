---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
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
