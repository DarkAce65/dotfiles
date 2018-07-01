" pathogen
execute pathogen#infect()
set laststatus=2

" vimtex
let g:vimtex_view_method = 'mupdf'

" colors
syntax on
let g:lightline = {'colorscheme': 'jellybeans'}

" misc
set number
filetype plugin indent on
