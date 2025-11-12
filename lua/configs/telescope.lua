local config = require("nvchad.configs.telescope").defaults


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
