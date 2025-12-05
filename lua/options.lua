require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both"
o.termguicolors = true
o.relativenumber = true
o.swapfile = false
-- o.completeopt = "popup,noinsert,noselect"
o.guicursor =
  "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,ve:ver25-Cursor/lCursor"

vim.g.copilot_enabled = 0
vim.opt.clipboard = "unnamedplus"
