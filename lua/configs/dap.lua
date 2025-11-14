-- DAP (Debug Adapter Protocol) configuration for Neovim
local M = {}

M.opts = function()
  local dap = require "dap"
  local dapui = require "dapui"

  -- Configure DAP UI
  dapui.setup {
    icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.25 },
          { id = "breakpoints", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.25 },
        },
        size = 40,
        position = "left",
      },
      {
        elements = {
          { id = "repl", size = 0.5 },
          { id = "console", size = 0.5 },
        },
        size = 10,
        position = "bottom",
      },
    },
    floating = {
      max_height = nil,
      max_width = nil,
      border = "single",
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil,
      max_value_lines = 100,
    },
  }

  -- Virtual text configuration
  require("nvim-dap-virtual-text").setup {
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = false,
    filter_references_pattern = "<module",
    virt_text_pos = "eol",
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil,
  }

  -- Auto open/close DAP UI
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  -- Configure Go debugging with delve
  require("dap-go").setup {
    dap_configurations = {
      {
        type = "go",
        name = "Attach remote",
        mode = "remote",
        request = "attach",
      },
    },
    delve = {
      path = "dlv",
      initialize_timeout_sec = 20,
      port = "${port}",
      args = {},
      build_flags = "",
      detached = vim.fn.has "win32" == 0,
      cwd = nil,
    },
  }
end

M.keys = {
  -- Debug control
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
    mode = "n",
  },
  {
    "<leader>dB",
    function()
      require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
    end,
    desc = "Conditional Breakpoint",
    mode = "n",
  },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
    mode = "n",
  },
  {
    "<leader>dC",
    function()
      require("dap").run_to_cursor()
    end,
    desc = "Run to Cursor",
    mode = "n",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
    mode = "n",
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
    mode = "n",
  },
  {
    "<leader>dO",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
    mode = "n",
  },
  {
    "<leader>dj",
    function()
      require("dap").down()
    end,
    desc = "Down",
    mode = "n",
  },
  {
    "<leader>dk",
    function()
      require("dap").up()
    end,
    desc = "Up",
    mode = "n",
  },
  {
    "<leader>dr",
    function()
      require("dap").repl.toggle()
    end,
    desc = "Toggle REPL",
    mode = "n",
  },
  {
    "<leader>ds",
    function()
      require("dap").session()
    end,
    desc = "Session",
    mode = "n",
  },
  {
    "<leader>dt",
    function()
      require("dap").terminate()
    end,
    desc = "Terminate",
    mode = "n",
  },
  {
    "<leader>dp",
    function()
      require("dap").pause()
    end,
    desc = "Pause",
    mode = "n",
  },
  -- DAP UI
  {
    "<leader>du",
    function()
      require("dapui").toggle()
    end,
    desc = "Toggle DAP UI",
    mode = "n",
  },
  {
    "<leader>de",
    function()
      require("dapui").eval()
    end,
    desc = "Eval",
    mode = { "n", "v" },
  },
  -- Go specific
  {
    "<leader>dgt",
    function()
      require("dap-go").debug_test()
    end,
    desc = "Debug Go Test",
    mode = "n",
  },
  {
    "<leader>dgl",
    function()
      require("dap-go").debug_last_test()
    end,
    desc = "Debug Last Go Test",
    mode = "n",
  },
}

return M
