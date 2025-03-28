return {
  -- nvim-lspconfig - встроенный набор настроек для работы LSP с разными языками.
  {
    "neovim/nvim-lspconfig",
    config = function()
      local servers = { "basedpyright", "lua_ls", "texlab" }

      local nvim_lsp = require("lspconfig")

      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        buffer = 0,
        command = "lua vim.lsp.buf.document_highlight()",
      })
      vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
        buffer = 0,
        command = "lua vim.lsp.buf.document_highlight()",
      })
      vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        buffer = 0,
        command = "lua vim.lsp.buf.clear_references()",
      })

      local my_custom_on_attach = function()
        vim.api.nvim_buf_set_keymap(0, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "c-]", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
      end

      nvim_lsp.lua_ls.setup {
        on_attach = my_custom_on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      nvim_lsp.basedpyright.setup {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
              autoSearchPaths = false,
            },
          },
        },
        on_attach = my_custom_on_attach,
        single_file_support = true,
      }

      nvim_lsp.texlab.setup { on_attach = my_custom_on_attach }
    end,
  },

  -- Mason для автоматической установки LSP-серверов, линтеров и пр.
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },
}
