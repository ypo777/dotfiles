vim.cmd 'packadd paq-nvim'
vim.opt.mouse = "a"
require 'paq'{
	'savq/paq-nvim';
  -- LspPlugins
  'hrsh7th/nvim-compe';
	'neovim/nvim-lspconfig';
  'kabouzeid/nvim-lspinstall';
  'onsails/lspkind-nvim';
  -- Nvim Tree
	'kyazdani42/nvim-tree.lua';
	'kyazdani42/nvim-web-devicons';
  -- Theme
	'navarasu/onedark.nvim';
  'norcalli/nvim-colorizer.lua';

  'terrortylor/nvim-comment';
  'windwp/nvim-autopairs';
  'nvim-treesitter/nvim-treesitter';
  'karb94/neoscroll.nvim';
  'lukas-reineke/indent-blankline.nvim';
  'glepnir/galaxyline.nvim';
  'lewis6991/gitsigns.nvim';
}

require('settings')
require('keymapping')
require('nvim-tree/main')
require('nvim-compe/main')
require('nvim-lspconfig/main')


