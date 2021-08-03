vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq

require 'paq'{
	'savq/paq-nvim';
  'hrsh7th/nvim-compe';
	'neovim/nvim-lspconfig';
  'kabouzeid/nvim-lspinstall';
 	'kyazdani42/nvim-tree.lua';
	'kyazdani42/nvim-web-devicons';
	'navarasu/onedark.nvim';
  'Yggdroot/indentLine';
  'terrortylor/nvim-comment';
  'onsails/lspkind-nvim';

}

require('nvim_comment').setup()
require('bufferline_settings')
require('settings')
require('keymapping')
require('statusline')
require('nvim-tree/main')
require('nvim-compe/main')

