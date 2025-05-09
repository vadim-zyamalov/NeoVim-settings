return {
  "catppuccin/nvim",
  priority = 1000,
  name = "catppuccin",
  config = function()
    local theme = require("catppuccin")
    theme.setup {
      integrations = {
        cmp = true,
        treesitter = true,
        mason = false,
        nvimtree = true,
        telescope = {
          enabled = true,
        },
      },
    }
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
