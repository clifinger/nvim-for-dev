require "nvchad.autocmds"
local function is_modified_buffer_open(buffers)
  for _, v in pairs(buffers) do
    if v.name:match "NvimTree_" == nil then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if
      #vim.api.nvim_list_wins() == 1
      and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil
      and is_modified_buffer_open(vim.fn.getbufinfo { bufmodified = 1 }) == false
    then
      vim.cmd "quit"
    end
  end,
})

local colors = require("base46").get_theme_tb "base_30"

local mode_colors = {
  n = colors.nord_blue, -- Normal
  i = colors.dark_purple, -- Insert
  v = colors.cyan, -- Visual
  V = colors.cyan, -- Visual Line
  c = colors.green, -- Command
  R = colors.orange, -- Replace
  s = colors.blue, -- Select
  t = colors.green, -- Terminal
}

local function update_cursorline_color()
  local current_mode = vim.fn.mode(1)
  local color = mode_colors[current_mode] or mode_colors.n
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = color, bold = true })
end

local augroup = vim.api.nvim_create_augroup("ModeColoring", { clear = true })

vim.api.nvim_create_autocmd({ "ModeChanged", "InsertEnter", "InsertLeave" }, {
  group = augroup,
  pattern = "*",
  callback = update_cursorline_color,
})

update_cursorline_color()

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.templ",
  callback = function()
    vim.bo.filetype = "templ"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "haskell",
  callback = function()
    local cmp = require "cmp"
    cmp.setup.buffer {
      enabled = function()
        local context = require "cmp.config.context"
        if vim.bo.buftype == "prompt" then
          return false
        end
        return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
      end,
    }
  end,
})
