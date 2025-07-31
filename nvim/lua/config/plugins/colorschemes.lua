local schemes = {
  dracula = {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    name = "dracula",
    config = function()
      vim.cmd.colorscheme("dracula")
    end,
  },

  catppuccin = {
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
  },
}

return schemes[vim.g.custom_colorscheme]
