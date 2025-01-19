local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  dev = require("utils").is_dev("fzf-lua"),
  cmd = "FzfLua",
}

function M.init()
  require("plugins.fzf-lua.mappings")
end

function M.config()
  -- Lazy load nvim-treesitter or help files err with:
  --   Query error at 2:4. Invalid node type "delimiter"
  -- This is due to fzf-lua calling `vim.treesitter.language.add`
  -- before nvim-treesitter is loaded
  pcall(require, "nvim-treesitter")

  require("plugins.fzf-lua.cmds")
  require("plugins.fzf-lua.setup").setup()

end

return M
