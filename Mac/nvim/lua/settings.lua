local cmd = vim.cmd
local set = vim.g
local opt = vim.opt
local buff_scp = vim.bo
local w_scp = vim.wo
local fnc = vim.fn
local exec = vim.api.nvim_exec

set.mapleader = " "
set.indentLine_enabled = 1
set.indentLine_char = '|'

opt.shortmess = 'c'
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
opt.lazyredraw = true

cmd [[colorscheme onedark]]
cmd([[au BufWritePre * :%s/\s\+$//e]]) -- Remove WhiteSpace On Save

