vim.g.mapleader = " "

-- Clear search highlightning
vim.keymap.set("n", "<esc><esc>", ':nohlsearch<cr>:let @/=""<cr>', { noremap = true, silent = true })

-- CD to the folder of the file
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>", { noremap = true, silent = true })

-- Copy-Paste as usual
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<C-x>", '"+x', { noremap = true, silent = true })
vim.keymap.set("i", "<C-v>", "<esc>Pi", { noremap = true, silent = true })

-- Window actions
-- https://github.com/josean-dev/dev-environment-files
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Tab actions
-- https://github.com/josean-dev/dev-environment-files
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Run python code in NeoVim
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python" },
  callback = function()
    vim.keymap.set(
      "n",
      "<F9>",
      ":w<CR>:exec '!python -u' shellescape(@%, 1)<CR>",
      { noremap = true, silent = true, buffer = true }
    )
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python" },
  callback = function()
    vim.keymap.set(
      "i",
      "<F9>",
      "<esc>:w<CR>:exec '!python -u' shellescape(@%, 1)<CR>",
      { noremap = true, silent = true, buffer = true }
    )
  end,
})
