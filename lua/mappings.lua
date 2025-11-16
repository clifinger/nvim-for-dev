require "nvchad.mappings"

-- This file contains custom key mappings for Neovim.
-- It overrides some default mappings and adds new ones.
--
local map = vim.keymap.set
local del = vim.keymap.del


map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><ESC>", { desc = "File: Save File" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "File: Quit Current Window" })
map("n", "<C-d>", "<C-d>zz", { desc = "Navigate: Scroll Down Half Page (Center)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Navigate: Scroll Up Half Page (Center)" })
map("n", "n", "nzzzv", { desc = "Navigate: Next Search Result (Center)" })

map("n", "x", '"_x', { desc = "Edit: Delete Character (No Yank)" })
map("v", "<", "<gv", { desc = "Edit: Indent Line (Visual Mode)" })
map("v", ">", ">gv", { desc = "Edit: Unindent Line (Visual Mode)" })
map("v", "p", '"_dP', { desc = "Edit: Paste Without Losing Yank (Visual Mode)" })

map("n", "<leader>v", "<C-w>v", { desc = "Window: Split Vertically" })
map("n", "<leader>h", "<C-w>s", { desc = "Window: Split Horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Window: Equalize Splits" })
del("n", "<leader>ff") -- remove default mapping

-- set toggle_transparency
map(
  "n",
  "<leader>tt",
  ":lua require('base46').toggle_transparency()<CR>",
  { noremap = true, silent = true, desc = "Toggle Background Transparency" }
)

-- Telescope: Include hidden and ignored files
map("n", "<leader>fh", function()
  require("telescope.builtin").find_files({
    hidden = true,
    no_ignore = true,
  })
end, { desc = "Telescope: Find Files (Hidden + Ignored)" })

-- Haskell: Run code lens (evaluate)
map({ "n", "i", "v" }, "<A-e>", function()
  if vim.fn.mode() == "i" then
    vim.cmd "stopinsert"
  end
  local ht = require('haskell-tools')
  ht.lsp.buf_eval_all()
end, { desc = "Haskell: Evaluate All" })

