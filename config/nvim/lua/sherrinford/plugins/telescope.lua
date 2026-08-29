return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        },
        file_browser = {
          hijack_netrw = true,
          grouped = true,
          hidden = true,
          respect_gitignore = false,
                    theme = "ivy"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      }
    })

    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')
    telescope.load_extension('ui-select')

    local opts = { noremap = true, silent = true }

    -- Files
    vim.keymap.set('n', '<leader>pf', builtin.find_files, opts)
    vim.keymap.set('n', '<C-p>', builtin.git_files, opts)
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, opts)
    vim.keymap.set('n', '<leader>pw', builtin.grep_string, opts) -- grep word under cursor
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, opts)
    vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, opts)

    -- File browser
    vim.keymap.set('n', '<leader>pB', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', opts)

    -- Git
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, opts)
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, opts)
    vim.keymap.set('n', '<leader>gs', builtin.git_status, opts)

    -- Diagnostics
    vim.keymap.set('n', '<leader>xx', builtin.diagnostics, opts)
    vim.keymap.set('n', '<leader>xf', function()
      builtin.diagnostics({ bufnr = 0 })
    end, opts)
    vim.keymap.set('n', '<leader>xe', function()
      builtin.diagnostics({ severity = vim.diagnostic.severity.ERROR })
    end, opts)
    vim.keymap.set('n', '<leader>xw', function()
      builtin.diagnostics({ severity = vim.diagnostic.severity.WARN })
    end, opts)
  end
}
