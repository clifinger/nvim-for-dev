-- /home/julien/.config/vim/lua/configs/copilot.lua
local M = {}
-- Variable for Toggle Copilot completion
vim.g.copilot_enabled = 1
local cmp = require "cmp"
local user = vim.env.USER or "User"
user = user:sub(1, 1):upper() .. user:sub(2)

M.opts = {
  auto_insert_mode = true,
  auto_select = true,
  question_header = "  " .. user .. " ",
  answer_header = "  Copilot ",
  window = {
    width = 0.4,
  },
  selection = function(source)
    local select = require("CopilotChat.select")
    return select.visual(source) or select.buffer(source)
  end,
}

M.keys = {

  -- CopilotChat mappings
  { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
  { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
  {
    "<C-y>",
    "copilot#Accept('<C-y>')",
    mode = "i",
    expr = true,
    silent = true,
    replace_keycodes = false,
    desc = "Accept Copilot suggestion",
  },
  {
    "<leader>aA",
    function()
      if vim.g.copilot_enabled == 1 then
        vim.cmd "Copilot disable"
        print "Copilot completion disabled"
      else
        vim.cmd "Copilot enable"
        print "Copilot completion enabled"
      end
    end,
    desc = "Toggle (Copilot completion)",
    mode = { "n", "v" },
  },
  {
    "<leader>aa",
    function()
      return require("CopilotChat").toggle()
    end,
    desc = "Toggle (CopilotChat)",
    mode = { "n", "v" },
  },
  {
    "<leader>ax",
    function()
      return require("CopilotChat").reset()
    end,
    desc = "Clear (CopilotChat)",
    mode = { "n", "v" },
  },
  {
    "<leader>aq",
    function()
      vim.ui.input({
        prompt = "Quick Chat: ",
      }, function(input)
        if input ~= "" then
          require("CopilotChat").ask(input)
        end
      end)
    end,
    desc = "Quick Chat (CopilotChat)",
    mode = { "n", "v" },
  },
  {
    "<leader>ap",
    function()
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")
      
      -- Capture visual selection directly if in visual mode
      local mode = vim.fn.mode()
      if mode:match('[vV]') then
        -- Get visual selection start and end positions
        local start_line = vim.fn.line('v')
        local end_line = vim.fn.line('.')
        local bufnr = vim.api.nvim_get_current_buf()
        
        -- Ensure correct order
        if start_line > end_line then
          start_line, end_line = end_line, start_line
        end
        
        -- Exit visual mode
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
        
        -- Get the lines content
        local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)
        local content = table.concat(lines, '\n')
        
        if vim.trim(content) ~= '' then
          -- Create a selection object
          local selection = {
            content = content,
            start_line = start_line,
            end_line = end_line,
            bufnr = bufnr,
          }
          
          chat.select_prompt({
            selection = function() return selection end,
          })
          return
        end
      end
      
      -- No selection or empty, use default behavior
      chat.select_prompt()
    end,
    desc = "Prompt Actions (CopilotChat)",
    mode = { "n", "v" },
  },
}

M.config = function(_, opts)
  require("render-markdown").setup {
    file_types = { "markdown", "copilot-chat" },
  }
  vim.g.copilot_no_tab_map = true
  local chat = require "CopilotChat"

  chat.setup(opts)

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "copilot-chat",
    callback = function(args)
      vim.b[args.buf].copilot_enabled = false
      cmp.setup.buffer { enabled = false }
    end,
  })
end

return M
