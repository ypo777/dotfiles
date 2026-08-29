vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

 -- Wrap telescope requires inside functions so they evaluate lazily on keypress
vim.keymap.set('n', 'gr', function()
  require('telescope.builtin').lsp_references()
end, { desc = 'LSP: Show References / Calls' })

vim.keymap.set('n', 'gd', function()
  require('telescope.builtin').lsp_definitions()
end, { desc = 'LSP: Go to Definition' })

vim.keymap.set('n', 'gI', function()
  require('telescope.builtin').lsp_implementations()
end, { desc = 'LSP: Go to Interface Implementation' })

vim.keymap.set('n', '<leader>ds', function()
  require('telescope.builtin').lsp_document_symbols()
end, { desc = 'LSP: Document Symbols' })

vim.keymap.set('n', '<leader>ws', function()
  require('telescope.builtin').lsp_dynamic_workspace_symbols()
end, { desc = 'LSP: Workspace Symbols' })

vim.keymap.set('n', '<leader>gs', function()
  require('telescope.builtin').git_status()
end, { desc = 'Telescope Git Status' })
