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

M.plugins = {
  override = {
    ["williamboman/mason.nvim"] = {
      opts = function(_, opts)
        vim.list_extend(opts.ensure_installed, { "goimports" })
      end,
    },
  },
}

return M