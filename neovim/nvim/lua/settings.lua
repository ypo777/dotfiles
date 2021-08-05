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

-- Plugins Call Settings
-- require('plugins_config/highlights')
require('lspkind').init()
require('plugins_config/icons')
require('plugins_config/bufferline_settings')
require('plugins_config/statusline')
require('plugins_config/gitsigns')
require('neoscroll').setup()
require('plugins_config/general').colorizer()

-- cmd [[colorscheme onedark]]
cmd([[au BufWritePre * :%s/\s\+$//e]]) -- Remove WhiteSpace On Save


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



