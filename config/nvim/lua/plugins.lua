local present, _ = pcall(require, "packerInit")
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

  -- Nvim Tree
	use'kyazdani42/nvim-tree.lua'
	use'kyazdani42/nvim-web-devicons'
  -- Theme
	use'navarasu/onedark.nvim';
  use'norcalli/nvim-colorizer.lua'
  -- Utilies
  use'terrortylor/nvim-comment'
  use'nvim-treesitter/nvim-treesitter'
  use'karb94/neoscroll.nvim'
  use'lukas-reineke/indent-blankline.nvim'
  use'glepnir/galaxyline.nvim'
  use'lewis6991/gitsigns.nvim'
  use'nvim-lua/plenary.nvim'
  use'akinsho/nvim-bufferline.lua'
  use'siduck76/nvim-base16.lua'
  use 'simrat39/symbols-outline.nvim'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}



  end
)

