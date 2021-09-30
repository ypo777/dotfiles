local present, _ = pcall(require, "packerinit")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return packer.startup(
  function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  -- LspPlugins
  use'hrsh7th/nvim-compe'
	use'neovim/nvim-lspconfig'
  use'kabouzeid/nvim-lspinstall'
  use 'onsails/lspkind-nvim'
  use 'windwp/nvim-autopairs'
  use 'glepnir/lspsaga.nvim'
  -- Nvim Tree
	use { 'kyazdani42/nvim-tree.lua',
      config = require("nvim-tree.main"),
}
	use'kyazdani42/nvim-web-devicons'
  -- Finder
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  -- Theme
  use'norcalli/nvim-colorizer.lua'
  use 'norcalli/nvim-base16.lua'
  -- Utilies
  use'terrortylor/nvim-comment'
  use'nvim-treesitter/nvim-treesitter'
  use'karb94/neoscroll.nvim'
  use'lukas-reineke/indent-blankline.nvim'
  use'glepnir/galaxyline.nvim'
  use'lewis6991/gitsigns.nvim'
  use'nvim-lua/plenary.nvim'
  use'akinsho/nvim-bufferline.lua'
  use 'simrat39/symbols-outline.nvim'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use 'yamatsum/nvim-cursorline'



  end
)

