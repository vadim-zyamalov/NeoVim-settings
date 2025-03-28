return {
    "rrethy/vim-hexokinase",
    run = "make hexokinase",
    event = { "BufReadPre", "BufNewFile" },
    cond = (vim.fn.has("unix") == 1),
    config = function()
      vim.g.Hexokinase_highlighters = { "backgroundfull" }
      vim.g.Hexokinase_refreshEvents = { "InsertLeave" }
      vim.g.Hexokinase_optInPatterns = {
        "full_hex",
        "triple_hex",
        "rgb",
        "rgba",
        "hsl",
        "hsla",
        "colour_names",
      }
      vim.api.nvim_create_autocmd({ "VimEnter" }, { command = "HexokinaseTurnOn" })
    end,
  }
