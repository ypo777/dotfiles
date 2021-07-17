syntax on
set number
set cursorline
set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on
set hlsearch
set showmatch
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'vim-airline/vim-airline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required

filetype plugin indent on    " required
set t_Co=256
set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
call airline#parts#define_function('foo', 'AirlineInit')
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' '])
    let g:airline_section_b = airline#section#create_left(['file'])
    let g:airline_section_c = airline#section#create(['%{getcwd()}'])
  endfunction
  autocmd User AirlineAfterInit call AirlineInit()

if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

if has('syntax') && has('eval')
  packadd! matchit
endif
