return {
  -- Treesitter. Сложно сказать, куда его включать...
  -- Это и жнец, и швец, и на дуде игрец.

  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  cond = (vim.fn.has("nvim-0.11") == 1),
  lazy = false,
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup {
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    }
    treesitter.install { "lua", "python", "latex" }
  end,
}
