" Line numbers
set number

" Syntax highlighting
syntax on

" Colorscheme
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
 
" Tabs and stuff
set shiftwidth=4        " Size of tab when using >> or <<
set tabstop=4           " Size of tab
set softtabstop=4       " Size of soft tab
set expandtab           " Enable soft tabs
set autoindent          " Automatically indent same as previous line

" Auto indenting based on filetype
if has("autocmd")
    filetype plugin indent on
endif

" Line wrap by word
set linebreak

" Turn on search highlighting
set hlsearch

" Enable mouse support
set mouse=a
