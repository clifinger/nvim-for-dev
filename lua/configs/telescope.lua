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
    local term = vim.api.nvim_open_term(bufnr, {})
    local function send_output(_, data, _)
      for _, d in ipairs(data) do
        vim.api.nvim_chan_send(term, d .. "\r\n")
      end
    end
    Job:new({
      command = "chafa",
      args = { filepath },
      on_stdout = send_output,
      on_stderr = send_output,
    }):sync()
  else
    previewers.buffer_previewer_maker(filepath, bufnr, opts)
  end
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
