local set = vim.g
local cmd = vim.cmd



-- Plugins Call Settings
require('lspkind').init()
require('plugins_config/icons')
require('plugins_config/bufferline_settings')
require('statusline.customstatusline')
require('plugins_config/gitsigns')
require('plugins_config.highlights')
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

-- Don't show statusline on vim terinal
vim.cmd [[ au TermOpen term://* setlocal nonumber laststatus=0 ]]
