local present,_ = pcall(require, "packerinit")
local packer

if present then
  packer = require "packer"
else
  return false
end

local use = packer.use

return packer.startup(
      function()
  -- Plugins-Install
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'

  --Nvim-Tree
  use {
   'kyazdani42/nvim-tree.lua',
    requires =  'kyazdani42/nvim-web-devicons'
  }

  -- LSP
  use'hrsh7th/nvim-compe'
  use'neovim/nvim-lspconfig'
  use'kabouzeid/nvim-lspinstall'
  use {
    'onsails/lspkind-nvim',
    config = function() require('lspkind').init() end
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end,
  }

  --TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
     config = function() require('utils.treesitter') end
  }
  --BlankLine
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('indent_blankline').setup {
      char = "|",
      show_end_of_line = true,
      buftype_exclude = {"terminal"}
    }
  end
  }

  -- Status Line
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('utils/statusline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}

  --Buffer line
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('utils.gitsigns') end
  }
  use'nvim-lua/plenary.nvim'
  use{'akinsho/nvim-bufferline.lua',
  config = function() require('utils.bufferline') end
  }

  -- Theme
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('nvim-colorizer').setup() end,
    cmd = 'ColorizerReloadAllBuffers'
  }
  use 'norcalli/nvim-base16.lua'

  -- Finder
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --Utils
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use 'yamatsum/nvim-cursorline'
  use 'karb94/neoscroll.nvim'
  use {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end
  }


end
)
