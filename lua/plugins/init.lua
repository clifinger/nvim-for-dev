---@diagnostic disable: different-requires
return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "configs.cmp"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    event = require("configs.noice").event,
    opts = require("configs.noice").opts,
    keys = require("configs.noice").keys,
    config = require("configs.noice").config,
  },
  -- Telescope (replaced by Snacks Picker)
  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  --   opts = {},
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = require("configs.treesitter-context").lazy,
    opts = require("configs.treesitter-context").opts,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = require("configs.snacks").keys,
    opts = function()
      local picker_config = require("configs.picker")
      local snacks_config = require("configs.snacks")
      return vim.tbl_extend("force", {
        lazygit = require "configs.lazygit",
        picker = picker_config.config.picker,
      }, snacks_config)
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = require("configs.whichkey").lazy,
    keys = require("configs.whichkey").keys,
    cmd = require("configs.whichkey").cmd,
    opts = require("configs.whichkey").opts,
  },
  {
    "stevearc/oil.nvim",
    opts = require "configs.oil",
    keys = require("configs.oil").keys,
    dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = require("configs.render-markdown").lazy,
    cmd = require("configs.render-markdown").cmd,
    dependencies = require("configs.render-markdown").dependencies,
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = require("configs.spectre").keys,
    opts = {},
  },
  -- Telescope (replaced by Snacks Picker)
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   lazy = false,
  --   keys = require("configs.telescope").keys,
  --   config = function()
  --     require "configs.telescope"
  --     require("telescope").load_extension "ui-select"
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = require "configs.treesitter",
    config = function(_, opts)
      -- Use the new API instead of the deprecated nvim-treesitter.configs
      require("nvim-treesitter").setup(opts)
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim", lazy = false },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    branch = "main",
    lazy = false,
    cmd = "CopilotChat",
    opts = require("configs.copilot").opts,
    config = require("configs.copilot").config,
    keys = require("configs.copilot").keys,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = require("configs.indent-blankline").event,
    main = require("configs.indent-blankline").main,
    opts = require("configs.indent-blankline").opts,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      return require "configs.mini"
    end,
  },
  -- DAP (Debug Adapter Protocol)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },
    keys = require("configs.dap").keys,
    config = function()
      require("configs.dap").opts()
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4",
    lazy = false,
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- haskell-tools can work without telescope
    },
  },
}
