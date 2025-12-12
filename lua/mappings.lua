require "nvchad.mappings"

-- This file contains custom key mappings for Neovim.
-- It overrides some default mappings and adds new ones.
--
local map = vim.keymap.set
local del = vim.keymap.del

-- Remove ALL NvChad Telescope mappings to use Snacks Picker instead
pcall(del, "n", "<leader>ff")
pcall(del, "n", "<leader>fb")
pcall(del, "n", "<leader>fh")
pcall(del, "n", "<leader>fo")
pcall(del, "n", "<leader>fw")
pcall(del, "n", "<leader>fz")

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

-- set toggle_transparency
map(
  "n",
  "<leader>tt",
  ":lua require('base46').toggle_transparency()<CR>",
  { noremap = true, silent = true, desc = "Toggle Background Transparency" }
)

-- Snacks Picker: Override NvChad mappings
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files" })

map("n", "<leader>fa", function()
  Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Find All Files (Hidden + Ignored)" })

map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Find Buffers" })

map("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Find Help Pages" })

map("n", "<leader>fo", function()
  Snacks.picker.recent()
end, { desc = "Find Recent Files" })

map("n", "<leader>fw", function()
  Snacks.picker.grep()
end, { desc = "Find Word (Live Grep)" })

map("x", "<leader>fw", function()
  Snacks.picker.grep_word()
end, { desc = "Find Selection in Files" })

map("n", "<leader>fz", function()
  Snacks.picker.lines()
end, { desc = "Find in Current Buffer" })

-- Git mappings
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Open Lazygit" })

map("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git Status" })

map("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git Branches" })

map("n", "<leader>gc", function()
  Snacks.picker.git_log()
end, { desc = "Git Commits" })

map("n", "<leader>gf", function()
  Snacks.picker.git_files()
end, { desc = "Git Files" })

-- Haskell: Run code lens (evaluate)
map({ "n", "i", "v" }, "<A-e>", function()
  if vim.fn.mode() == "i" then
    vim.cmd "stopinsert"
  end
  local ht = require('haskell-tools')
  ht.lsp.buf_eval_all()
end, { desc = "Haskell: Evaluate All" })

-- Toggle auto-completion
map("n", "<leader>tc", function()
  local cmp = require "cmp"
  if vim.g.cmp_auto_enabled then
    cmp.setup { completion = { autocomplete = false } }
    vim.g.cmp_auto_enabled = false
    print "Auto-completion disabled"
  else
    cmp.setup { completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } }
    vim.g.cmp_auto_enabled = true
    print "Auto-completion enabled"
  end
end, { desc = "Toggle Auto-completion" })

