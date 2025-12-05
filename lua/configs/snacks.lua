local picker_config = require("configs.picker")

return {
  keys = vim.list_extend({
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
  }, picker_config.keys or {}),
}
