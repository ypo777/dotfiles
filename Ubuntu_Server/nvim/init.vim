"General Setting
set nu
set cursorline
syntax on


"Plugin Setting
call plug#begin(stdpath('config'))
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-airline/vim-airline'
	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
	Plug 'neovim/nvim-lspconfig'
call plug#end()

"Color & Theme Settings
set t_Co=256

"Status Line
let g:airline_theme='dark'

"Key-bindings
nnoremap <C-s> :source ~/.config/nvim/init.vim<CR>

"Lua Config
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
