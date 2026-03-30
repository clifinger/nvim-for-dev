local picker_config = require("configs.picker")

return {
  image = {
    enabled = true,
    force = false, -- Only use if terminal doesn't support it, but Ghostty does
    doc = {
      enabled = true,
      inline = true, -- Render inline in buffers
      float = true, -- Fallback to floating window
      max_width = 80,
      max_height = 40,
    },
    env = {
      SNACKS_GHOSTTY = true, -- Force Ghostty detection as per docs
    },
  },
  keys = vim.list_extend({
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>si",
      function()
        Snacks.image.hover()
      end,
      desc = "Image Hover",
    },
  }, picker_config.keys or {}),
}
