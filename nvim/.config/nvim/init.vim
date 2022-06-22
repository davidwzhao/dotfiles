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

"
" Plugins!
"
call plug#begin()

" Native LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

" Configure LSP
:lua << EOF
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    vim.diagnostic.config {
      virtual_text = false,
      signs = false,
      underline = false,
    }

    -- vim.lsp.set_log_level("debug")

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    -- local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'ccls', 'julials' }
    local servers = { 'ccls' }
    for _, lsp in pairs(servers) do
      require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
          -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
      }
    end

    require'lspconfig'.julials.setup{
        on_attach = on_attach,
        on_new_config = function(new_config, _)
            local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
            if require'lspconfig'.util.path.is_file(julia) then
                new_config.cmd[1] = julia
            end
        end
    }
EOF
