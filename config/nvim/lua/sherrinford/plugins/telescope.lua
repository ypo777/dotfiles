return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        }
      }
    })
    telescope.load_extension('fzf')
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>pf', builtin.find_files, opts)
    vim.keymap.set('n', '<C-p>', builtin.git_files, opts)
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, opts)
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})


    vim.keymap.set('n', '<leader>gc', builtin.git_commits, opts)
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, opts)
    vim.keymap.set('n', '<leader>gs', builtin.git_status, opts)

    vim.keymap.set('n', '<leader>xx', builtin.diagnostics, opts) -- All diagnostics
    vim.keymap.set('n', '<leader>xf', function()
      builtin.diagnostics({ bufnr = 0 })                         -- Current buffer only
    end, opts)
    vim.keymap.set('n', '<leader>xe', function()
      builtin.diagnostics({ severity = vim.diagnostic.severity.ERROR }) -- Errors only
    end, opts)
    vim.keymap.set('n', '<leader>xw', function()
      builtin.diagnostics({ severity = vim.diagnostic.severity.WARN }) -- Warnings only
    end, opts)
  end
}
