-- Patch pour forcer l'affichage d'images dans le picker
local original_file = require("snacks.picker.preview").file

require("snacks.picker.preview").file = function(ctx)
  local path = require("snacks.picker.util").path(ctx.item)
  if path then
    local supports = Snacks.image.supports_file(path)
    
    if supports then
      local buf = ctx.preview:scratch()
      ctx.preview:set_title(ctx.item.title or vim.fn.fnamemodify(path, ":t"))
      Snacks.image.buf.attach(buf, { src = path })
      return
    end
  end
  return original_file(ctx)
end
