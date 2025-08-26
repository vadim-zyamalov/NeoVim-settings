-- NeoVim
vim.cmd([[syntax on]])
vim.cmd([[filetype on]])
vim.cmd([[filetype plugin on]])

vim.opt.foldenable = false

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Number of lines and symbols to keep while scrolling
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5

-- Show substitute results in the same buffer
vim.opt.inccommand = "nosplit"

-- Show 80-th column in text
vim.opt.colorcolumn = "79"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Langmap
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Vim settings
vim.opt.completeopt = "menuone,noselect"

-- Indentation
vim.opt.autoindent = true

-- Cursorline and cursorcolumn
vim.api.nvim_create_autocmd({ "WinLeave" }, { command = "set nocursorline nocursorcolumn" })
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, { command = "set cursorline cursorcolumn" })

-- Color scheme
vim.g.custom_colorscheme = "catppuccin"
