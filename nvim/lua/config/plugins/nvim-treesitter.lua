return {
  -- Treesitter. Сложно сказать, куда его включать...
  -- Это и жнец, и швец, и на дуде игрец.

  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  config = function()
    local treesitter = require("nvim-treesitter.config")
    treesitter.setup {
      ensure_installed = { "lua", "python", "latex" },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
