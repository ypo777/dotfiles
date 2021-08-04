-------------------- HELPERS -------------------------------
local cmd = vim.cmd
local fn  = vim.fn
local g   = vim.g
local opt = vim.opt

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-------------------- PLUGINS -------------------------------
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq

paq {'savq/paq-nvim'}
paq {'lukas-reineke/indent-blankline.nvim'}
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'} 
paq {'neovim/nvim-lspconfig'}
paq {'ayu-theme/ayu-vim'}
paq {'hoob3rt/lualine.nvim'}
paq {'kyazdani42/nvim-web-devicons', opt = true}
paq {'kyazdani42/nvim-tree.lua'}
-------------------- OPTIONS -------------------------------
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
vim.o.background = 'dark'
-------------------- THEMES -------------------------------
g.ayucolor = "dark"
cmd 'colorscheme ayu'
g.ayu_italic_comment = 1
-------------------- MAPPINGS ------------------------------
g.mapleader = " "
map('', '<leader>c', '"+y')
map('i', '<C-u>', '<C-g>u<C-u>')
map('i', '<C-w>', '<C-g>u<C-w>')
map('n', '<C-s>', '<cmd>source ~/.config/nvim/init.lua<CR>')
map('n', '<C-l>', '<cmd>noh<CR>') 
map('n', '<leader>p', '<cmd>PaqInstall<CR>')
map('n', '<leader>l', '<cmd>PaqList<CR>')
map('n', '<leader>o', 'm`o<Esc>``') 
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>r','<cmd>NvimTreeRefresh<CR>')
map('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>')
-------------------- TREE-SITTER ---------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      use_language = true
    }
}
-------------------- INDENTLINE---------------------------
g.indentLine_enabled = 1
g.indentLine_blankline_char = "│"
g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
g.indent_blankline_char_highlight_list = {'Function'}
g.indent_blankline_use_treesitter = true

-------------------- STATUS LINE---------------------------
local function apple()
  return [[]]
end
local function file()
  return [[ﴜ]]
end
local statusline = require('lualine')
statusline.setup{
  options = { 
    icons_enabled = 1,
    theme = 'ayu_mirage',
    component_separators = {'▋',''},
    section_separators = ''
  },
  sections = {
    lualine_a = { apple , 'mode'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {},
    lualine_z = {file,'progress'}
  },
  extensions = {'nvim-tree'}
}
-------------------- Nvim Tree ---------------------------
g.nvim_tree_auto_open = 1

