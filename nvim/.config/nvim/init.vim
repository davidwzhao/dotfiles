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

" Julia function call highlighting
hi link juliaFunctionCall Identifier

" Line at column 92
set colorcolumn=92

" Line wrap by word
set linebreak

" Scroll offset keeps n context lines on screen
set scrolloff=5

" Turn on search highlighting
set hlsearch
set noincsearch

" Use system clipboard
set clipboard=unnamedplus

" Enable mouse support
set mouse=a
" set ttymouse=sgr        " Handle mouse correctly after column 220

" Enable spell check
setlocal spell spelllang=en_us

" Enable persistent undo
set undofile
set undodir=~/.cache/nvimundo

" Disable modelines for security reasons
set nomodeline

" Set automatic line breaking
set tw=92
autocmd FileType tex set textwidth=92
autocmd FileType markdown set textwidth=92

" Set lisp syntax highlighting for *.clisp files
autocmd BufNewFile,BufRead *.clisp set syntax=lisp

" Set souffle syntax highlighting for *.dl files
autocmd BufNewFile,BufRead *.dl set syntax=souffle

" Set delve syntax highlighting for *.rel files
autocmd BufNewFile,BufRead *.rel set syntax=delve

" Smoother vim scrolling on touchpad
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" omnifunc autocompletion without LSP
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

inoremap <C-n> <C-x><C-o>

"
" Plugins!
"
call plug#begin()

" Native LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

lua require('init')
