" Line numbers
set number

" Syntax highlighting
syntax on

" Colorscheme
set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_degrade=0
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
colorscheme gruvbox
 
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

" Fix latex indenting
let g:tex_flavor='latex'

" Line at column 80
" set colorcolumn=80

" Line wrap by word
set linebreak

" Scroll offset keeps n context lines on screen
set scrolloff=5

" Turn on search highlighting
set hlsearch

" Use system clipboard
set clipboard=unnamedplus

" Enable mouse support
set mouse=a

" Enable spell check
" setlocal spell spelllang=en_us

" Enable persistent undo
set undofile
set undodir=~/.vimundo
