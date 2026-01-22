pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "python",
    "javascript",
    "typescript",
    "json",
    "yaml",
    "markdown",
    "markdown_inline",
    "bash",
    "dockerfile",
    "gitcommit",
    "git_rebase",
    "diff",
    "regex",
    "sql",
    "toml",
    "rust",
    "zig",
    "templ",
    "haskell",
    "gleam",
  },
  
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}
