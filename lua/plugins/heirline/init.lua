return {
  "rebelot/heirline.nvim",
  -- enabled = false,
  event = "BufReadPost",
  config = function()
    local utils = require("heirline.utils")
    local setup_colors = function()
      local is_nightfly = vim.g.colors_name == "nightfly"
      return {
        -- statusline_bg = utils.get_highlight("StatusLine").bg,
        red_fg = utils.get_highlight("ErrorMsg").fg,
        green_fg = is_nightfly
            and utils.get_highlight("NightflyTurquoise").fg
            or utils.get_highlight("diffAdded").fg,
        yellow_fg = is_nightfly
            and utils.get_highlight("NightflyYellow").fg
            or utils.get_highlight("WarningMsg").fg,
        magenta_fg = is_nightfly
            and utils.get_highlight("NightflyViolet").fg
            or utils.get_highlight("WarningMsg").fg,
      }
    end
    require("heirline").setup({
      opts = { colors = setup_colors },
      statusline = require("plugins.heirline.statusline"),
    })
    vim.api.nvim_create_augroup("Heirline", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        utils.on_colorscheme(setup_colors)
      end,
      group = "Heirline",
    })
  end
}
