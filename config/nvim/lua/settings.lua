
require 'nvim-web-devicons'.setup{ default = true;}

local autopairs_completion = require('nvim-autopairs.completion.compe')
autopairs_completion.setup(
  {
      map_cr = true,
      map_complete = true
  }
)

vim.cmd([[au BufWritePre * :%s/\s\+$//e]]) -- Remove WhiteSpace On Save

