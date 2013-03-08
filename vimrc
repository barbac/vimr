"pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()


"options
set nocompatible
filetype plugin indent on
set number
set nobackup
set autochdir "current file's path as working directory
set fileformats=unix,dos
set wildmenu
set wildmode=longest:full,full

autocmd BufNewFile,BufRead *.md set filetype=markdown


"indentation
set expandtab
set shiftwidth=4
set softtabstop=4 " <BS> deletes indentation.
set autoindent
"
"this should remove any extra white space
"on the document before saving
autocmd BufWritePre * :%s/\s\+$//e

"fonts and colors
if has("unix")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("win32")
    set guifont=Consolas:h11:cANSI
endif

syntax on


"search
set ignorecase
set smartcase
set hlsearch
set incsearch


"remaps
"<Esc>x2 to save the file
inoremap <Esc><Esc> <Esc>:w<CR>
noremap <leader>l :ls<CR>:b<space>
