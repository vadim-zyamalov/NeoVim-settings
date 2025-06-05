local nv11 = vim.fn.has("nvim-0.11")
local parsers = { "lua", "python", "latex" }

return {
  -- Treesitter. Сложно сказать, куда его включать...
  -- Это и жнец, и швец, и на дуде игрец.

  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = nv11 == 1 and "main" or "master",
  lazy = false,
  config = function()
    if nv11 == 1 then
      local treesitter = require("nvim-treesitter")
      treesitter.install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = parsers,
        callback = function()
          vim.treesitter.start()
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    else
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup {
        ensure_installed = parsers,
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
    end
  end,
}
