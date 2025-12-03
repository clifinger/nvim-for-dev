local config = require("nvchad.configs.telescope").defaults

config.preview = config.preview or {}
config.preview.filesize_limit = 20

return {
  defaults = config,
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
  keys = {
    {
      "<leader> ",
      function()
        require("telescope.builtin").find_files()
      end,
      mode = "n",
      desc = "find files",
    },
  },
}
