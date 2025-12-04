require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "vtsls",
  "jsonls",
  "pyright",
  "bashls",
  "gopls",
  "clangd",
  "marksman",
  "lua_ls",
  "yamlls",
  "dockerls",
  "ruff",
  "terraformls",
  "zls",
  "tailwindcss",
  "biome",
  "sourcekit",
  "templ",
  "gleam",
}
vim.lsp.enable(servers)
