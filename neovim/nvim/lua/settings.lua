local set = vim.g
local opt = vim.opt
local cmd = vim.cmd
set.mapleader = " "
set.termguicolors = true
set.completeopt=menuone,noselect

-- Plugins Call Settings
require('lspkind').init()
require('plugins_config/icons')
require('plugins_config/bufferline_settings')
require('plugins_config/statusline')
require('plugins_config/gitsigns')
require('neoscroll').setup({hide_cursor = false})
require('plugins_config/general').colorizer()

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



