uv = vim.loop or vim.uv

local utils = require("utils")

if not utils.__HAS_NVIM_08 then
  utils.warn("nvim-lua requires neovim > 0.8")
  vim.o.loadplugins = false
  vim.o.termguicolors = true
  return
end

require("options")
require("autocmd")
require("keymaps")

-- Don't load plugins as root and use a different colorscheme
-- NOTE: embark colorscheme set transparent background for root in "options.lua"
if not utils.is_root() then
  require("lazyplug")
  if #vim.api.nvim_list_uis() > 0 then
    vim.cmd.colorscheme("nightfly")
    -- vim.cmd.colorscheme("lua-embark")
  end
end
