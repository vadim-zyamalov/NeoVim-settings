-- Treesitter. Сложно сказать, куда его включать...
-- Это и жнец, и швец, и на дуде игрец.

local nv11 = vim.fn.has("nvim-0.11")
local parsers = { "lua", "python", "latex" }

if nv11 == 1 then
  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
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
    end,
  }
else
  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    cond = (vim.fn.has("nvim-0.10") == 1),
    lazy = false,
    config = function()
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
    end,
  }
end
