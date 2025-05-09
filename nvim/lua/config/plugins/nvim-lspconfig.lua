return {
  -- nvim-lspconfig - встроенный набор настроек для работы LSP с разными языками.
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", {}),
        callback = function(_)
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
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<leader>rn",
            "<cmd>lua vim.lsp.buf.rename()<CR>",
            { noremap = true, desc = "Rename symbol" }
          )
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "c-]",
            "<cmd>lua vim.lsp.buf.definition()<CR>",
            { noremap = true, desc = "Go to the definition" }
          )
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "K",
            "<cmd>lua vim.lsp.buf.hover()<CR>",
            { noremap = true, desc = "Hover" }
          )
        end,
      })

      local opts = {
        servers = {

          lua_ls = {
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
          },

          basedpyright = {
            settings = {
              basedpyright = {
                analysis = {
                  typeCheckingMode = "standard",
                  autoSearchPaths = false,
                },
              },
            },
            single_file_support = true,
          },

          texlab = {},
        },
      }

      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
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
