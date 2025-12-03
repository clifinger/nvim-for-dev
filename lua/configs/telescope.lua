local config = require("nvchad.configs.telescope").defaults

config.preview = config.preview or {}
config.preview.filesize_limit = 20

-- Add image preview with chafa
local previewers = require("telescope.previewers")
local Job = require("plenary.job")

local image_previewer = function(filepath, bufnr, opts)
  local is_image = function(path)
    local image_extensions = { "png", "jpg", "jpeg", "gif", "webp", "svg" }
    local split_path = vim.split(path:lower(), ".", { plain = true })
    local extension = split_path[#split_path]
    return vim.tbl_contains(image_extensions, extension)
  end

  if is_image(filepath) then
    -- Try to find chafa in PATH, fallback to common locations
    local chafa_cmd = vim.fn.exepath("chafa")
    if chafa_cmd == "" then
      -- Fallback: try to find in nix store
      local handle = io.popen("ls /nix/store/*-chafa-*/bin/chafa 2>/dev/null | head -1")
      if handle then
        chafa_cmd = handle:read("*a"):gsub("%s+", "")
        handle:close()
      end
    end
    
    if chafa_cmd ~= "" then
      local term = vim.api.nvim_open_term(bufnr, {})
      local function send_output(_, data, _)
        for _, d in ipairs(data) do
          vim.api.nvim_chan_send(term, d .. "\r\n")
        end
      end
      Job:new({
        command = chafa_cmd,
        args = { filepath },
        on_stdout = send_output,
        on_stderr = send_output,
      }):sync()
      return
    end
  end
  
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

config.buffer_previewer_maker = image_previewer

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
