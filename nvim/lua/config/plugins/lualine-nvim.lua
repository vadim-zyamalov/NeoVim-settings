return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lazy_status = require("lazy.status")

      require("lualine").setup {
        options = {
          theme = "catppuccin",
        },
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
            },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
          },
        },
      }
    end,
  },

  -- Строка вкладок с буферами
  {
    "echasnovski/mini.tabline",
    version = false,
    config = true,
  },
}
