local options = {
  formatters = {
    ["markdown-toc"] = {
      condition = function(_, ctx)
        for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
          if line:find "<!%-%- toc %-%->" then
            return true
          end
        end
      end,
    },
    ["templ"] = {
      command = "templ",
      args = { "fmt" },
    },
    ["biome"] = {
      command = "biome",
      args = {
        "check",
        "--formatter-enabled=true",
        "--write",
        "--stdin-file-path",
        "$FILENAME",
      },
    },
    ["zigfmt"] = {
      command = "zig",
      args = {
        "fmt",
        "--stdin",
      },
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt" },
    ["javascript"] = { "biome" },
    ["javascriptreact"] = { "biome" },
    ["typescript"] = { "biome" },
    ["typescriptreact"] = { "biome" },
    ["json"] = { "biome-check" },
    ["css"] = { "biome-check" },
    markdown = { "markdownlint-cli2", "markdown-toc" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    go = { "goimports", "gofumpt" },
    html = { "biome" },
    zig = { "zigfmt" },
    templ = { "templ" },
    haskell = { "fourmolu" },
    ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
