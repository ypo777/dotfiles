local set = vim.g
local opt = vim.opt
local cmd = vim.cmd
set.mapleader = " "

opt.shortmess = 'c'
opt.mouse = "a"
opt.scrolloff = 4
opt.shiftround = true
opt.smartcase = true
opt.termguicolors = true
opt.hidden 	= true
opt.cul		= true
opt.number	= true
opt.tabstop	= 2
opt.expandtab	= true
opt.shiftwidth	= 2
opt.smartindent = true
opt.lazyredraw = true

cmd [[colorscheme onedark]]
cmd([[au BufWritePre * :%s/\s\+$//e]]) -- Remove WhiteSpace On Save
-- Plugins Call Settings
require('plugins_config/highlights')
require('lspkind').init()
require('plugins_config/icons')
-- require('plugins_config/bufferline_settings')
require('plugins_config/statusline')
require('neoscroll').setup()
local gitsign = require('gitsigns')
gitsign.setup {
    signs = {
        add = {hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
    },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    watch_index = {
        interval = 100
    },
    sign_priority = 5,
    status_formatter = nil -- Use default
}

local clizer = require('colorizer')
clizer.setup()
cmd[["ColorizerReloadAllBuffers"]]

local autopairs = require('nvim-autopairs')
local autopairs_completion = require('nvim-autopairs.completion.compe')

autopairs.setup()
autopairs_completion.setup(
  {
      map_cr = true,
      map_complete = true
  }
)
require('nvim_comment').setup()
local treesitter = require('nvim-treesitter.configs')

treesitter.setup{
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    use_languagetree = true
  }
}

local blankline = function()
      set.indentLine_enabled = 1
end
blankline()



