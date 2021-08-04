vim.cmd 'packadd paq-nvim'

require 'paq'{
	'savq/paq-nvim';
  'hrsh7th/nvim-compe';
	'neovim/nvim-lspconfig';
  'kabouzeid/nvim-lspinstall';
 	'kyazdani42/nvim-tree.lua';
	'kyazdani42/nvim-web-devicons';
	'navarasu/onedark.nvim';
  'terrortylor/nvim-comment';
  'onsails/lspkind-nvim';
  'windwp/nvim-autopairs';
  'nvim-treesitter/nvim-treesitter';
  'karb94/neoscroll.nvim';
  'lukas-reineke/indent-blankline.nvim';
  'glepnir/galaxyline.nvim';
  'norcalli/nvim-colorizer.lua';
  'nvim-lua/plenary.nvim';
  'lewis6991/gitsigns.nvim';
}

require('settings')
require('keymapping')
require('nvim-tree/main')
require('nvim-compe/main')
require('nvim-lspconfig/main')


