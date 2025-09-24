return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  keys = {
    { "<Leader>vs", "<cmd>VenvSelect<cr>", desc = "Select venv" },
  },
  ---@type venv-selector.Config
  opts = {
    -- Your settings go here
  },
}
