
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
call plug#end()

" Set background to dark
set background=dark
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
set wildmode=list:longest,full
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
"set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable line numbers
set number
" Enable fold on syntax
set foldmethod=syntax
set foldlevelstart=20
" Highlight current line
set cursorline
" Make tabs as wide as four spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>

" Toggle NERDTree
nmap <silent> <F2> :NERDTreeToggle<CR>
" Set color scheme
colorscheme gruvbox
"colorscheme dracula

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline_experimental = 1

" go requires gopls, clangd requires clangd
let g:coc_global_extensions = ['coc-clangd', 'coc-json', 'coc-go', 'coc-tag']

" Use <cr> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" enable gtags module, requires gnu-global
let g:gutentags_modules = ['ctags', 'gtags_cscope']

