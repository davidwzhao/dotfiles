" Line numbers
set number

" Syntax highlighting
syntax on

" Colorscheme
set background=light
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" let g:solarized_degrade=0
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
colorscheme noctu
 
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
set ttymouse=sgr        " Handle mouse correctly after column 220

" Enable spell check
setlocal spell spelllang=en_us

" Enable persistent undo
set undofile
set undodir=~/.vimundo

" Disable modelines for security reasons
set nomodeline

" Set automatic line breaking
" set tw=120

" Set lisp syntax highlighting for *.clisp files
autocmd BufNewFile,BufRead *.clisp set syntax=lisp

" Set souffle syntax highlighting for *.dl files
autocmd BufNewFile,BufRead *.dl set syntax=souffle

" Smoother vim scrolling on touchpad
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
