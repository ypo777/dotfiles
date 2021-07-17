syntax on 
set nu
set cursorline
set t_Co=256
set background=dark
set laststatus=2

"Airline Theme Config
let g:airline_theme='light'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
call airline#parts#define_function('foo', 'AirlineInit')
function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' '])
    let g:airline_section_b = airline#section#create_left(['ffenc','file'])
    let g:airline_section_c = airline#section#create(['%{getcwd()}'])
  endfunction
  autocmd User AirlineAfterInit call AirlineInit()
