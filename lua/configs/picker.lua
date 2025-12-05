local colors = require("base46").get_theme_tb "base_30"
local syntax = require("base46").get_theme_tb "base_16"

-- Setup highlight groups for snacks picker to match NvChad theme
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerNormalBorder", { fg = colors.grey })
vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerFooter", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "SnacksPickerHeader", { fg = colors.cyan })
vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = colors.nord_blue, bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerCursor", { bg = colors.one_bg2 })
vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = colors.blue })
vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = colors.white })
vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bg = colors.black2 })

-- Snacks Picker configuration
return {
  configure = true,
  config = {
    picker = {
      ui_select = true,
      prompt = " ",
      sources = {},
      focus = "input",
      show_delay = 5000,
      limit_live = 10000,
      layout = {
        cycle = true,
        preset = function()
          return vim.o.columns >= 120 and "default" or "vertical"
        end,
      },
      matcher = {
        fuzzy = true,
        smartcase = true,
        ignorecase = true,
        sort_empty = false,
        filename_bonus = true,
        file_pos = true,
      },
      sort = {
        fields = { "score:desc", "#text", "idx" },
      },
      previewers = {
        file = {
          max_size = 1024 * 1024, -- 1MB
          max_line_length = 500,
        },
      },
      formatters = {
        file = {
          filename_first = false,
          truncate = "center",
          min_width = 40,
          filename_only = false,
          icon_width = 2,
          git_status_hl = true,
        },
        selected = {
          show_always = false,
          unselected = true,
        },
      },
      win = {
        input = {
          bo = { filetype = "snacks_picker_input" },
          wo = { winblend = 0 },
          border = "rounded",
          title_pos = "center",
          keys = {
            ["<C-c>"] = { "cancel", mode = "i" },
            ["<CR>"] = { "confirm", mode = { "n", "i" } },
            ["<Esc>"] = "cancel",
            ["<C-j>"] = { "list_down", mode = { "i", "n" } },
            ["<C-k>"] = { "list_up", mode = { "i", "n" } },
            ["<C-n>"] = { "list_down", mode = { "i", "n" } },
            ["<C-p>"] = { "list_up", mode = { "i", "n" } },
            ["<Down>"] = { "list_down", mode = { "i", "n" } },
            ["<Up>"] = { "list_up", mode = { "i", "n" } },
            ["<C-d>"] = { "list_scroll_down", mode = { "i", "n" } },
            ["<C-u>"] = { "list_scroll_up", mode = { "i", "n" } },
            ["<C-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<C-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
            ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
            ["<C-a>"] = { "select_all", mode = { "n", "i" } },
            ["<C-q>"] = { "qflist", mode = { "i", "n" } },
            ["<C-v>"] = { "edit_vsplit", mode = { "i", "n" } },
            ["<C-s>"] = { "edit_split", mode = { "i", "n" } },
            ["<C-t>"] = { "tab", mode = { "n", "i" } },
            ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
            ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
          },
        },
        list = {
          bo = { filetype = "snacks_picker_list" },
          wo = {
            conceallevel = 2,
            concealcursor = "nvc",
            winblend = 0,
          },
          border = "rounded",
          keys = {
            ["<CR>"] = "confirm",
            ["<C-v>"] = "edit_vsplit",
            ["<C-s>"] = "edit_split",
            ["<C-t>"] = "tab",
            ["<Esc>"] = "cancel",
            ["q"] = "cancel",
            ["j"] = "list_down",
            ["k"] = "list_up",
            ["<C-j>"] = "list_down",
            ["<C-k>"] = "list_up",
            ["<C-d>"] = "list_scroll_down",
            ["<C-u>"] = "list_scroll_up",
            ["gg"] = "list_top",
            ["G"] = "list_bottom",
          },
        },
        preview = {
          bo = { filetype = "snacks_picker_preview" },
          wo = { winblend = 0 },
          border = "rounded",
          keys = {
            ["<Esc>"] = "cancel",
            ["q"] = "cancel",
          },
        },
      },
      icons = {
        files = {
          enabled = true,
          dir = "󰉋 ",
          dir_open = "󰝰 ",
          file = "󰈔 ",
        },
        git = {
          enabled = true,
          commit = "󰜘 ",
          staged = "●",
          added = "",
          deleted = "",
          ignored = " ",
          modified = "○",
          renamed = "",
          unmerged = " ",
          untracked = "?",
        },
        diagnostics = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },
        ui = {
          live = "󰐰 ",
          hidden = "h",
          ignored = "i",
          follow = "f",
          selected = "● ",
          unselected = "○ ",
        },
      },
      -- Colorscheme picker integration (like NvChad theme picker)
      sources = {
        colorschemes = {
          layout = { preset = "vertical" },
          preview = "colorscheme",
          confirm = function(picker, item)
            picker:close()
            if item then
              picker.preview.state.colorscheme = nil
              vim.schedule(function()
                vim.cmd("colorscheme " .. item.text)
              end)
            end
          end,
        },
      },
    },
  },
  -- Keymaps for Snacks Picker
  keys = {
    -- Top Pickers
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },

    -- Find files
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fa",
      function()
        Snacks.picker.files({ hidden = true, ignored = true })
      end,
      desc = "Find All Files (Hidden + Ignored)",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Grep Word",
      mode = { "n", "x" },
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent Files",
    },
    {
      "<leader>fz",
      function()
        Snacks.picker.grep()
      end,
      desc = "Live Grep",
    },

    -- Git related
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gB",
      function()
        Snacks.picker.git_branches({ all = true })
      end,
      desc = "Git Branches (All + Remote)",
    },
    {
      "<leader>gc",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Commits (Log)",
    },
    {
      "<leader>gC",
      function()
        local file = vim.fn.expand("%:p")
        if file ~= "" and vim.fn.filereadable(file) == 1 then
          Snacks.picker.git_log_file()
        else
          vim.notify("Not in a file buffer", vim.log.levels.WARN)
        end
      end,
      desc = "Git Commits (Current File)",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gD",
      function()
        Snacks.picker.git_diff({ staged = true })
      end,
      desc = "Git Diff (Staged)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Git Files (Tracked)",
    },
    {
      "<leader>gF",
      function()
        Snacks.picker.git_files({ untracked = true })
      end,
      desc = "Git Files (All + Untracked)",
    },
    {
      "<leader>gG",
      function()
        Snacks.picker.git_grep()
      end,
      desc = "Git Grep",
    },
    {
      "<leader>gl",
      function()
        local file = vim.fn.expand("%:p")
        if file ~= "" and vim.fn.filereadable(file) == 1 then
          Snacks.picker.git_log_line()
        else
          vim.notify("Not in a file buffer", vim.log.levels.WARN)
        end
      end,
      desc = "Git Log (Current Line)",
    },

    -- GitHub (requires gh CLI)
    {
      "<leader>ghi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>ghI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>ghp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>ghP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "GitHub Pull Requests (all)",
    },

    -- LSP
    {
      "<leader>ls",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Document Symbols",
    },
    {
      "<leader>ld",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "LSP Diagnostics",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "LSP References",
    },
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "LSP Definitions",
    },

    -- Theme picker (NvChad style)
    {
      "<leader>th",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Theme Picker",
    },

    -- Search
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume Last Picker",
    },
  },
}
