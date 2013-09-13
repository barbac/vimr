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


"python
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
"Suppress errors
"Ignore lines > 79 chars
"pylint lines > 80
"Docstrings
"Access protected method
"Attribute define outside __init__
"Abstract method not overridden
"Too many local variables
"Too many branches
"TODO_text
let g:pymode_lint_ignore = "E501,C0301,C0110,W0212,W0201,W0223,R0914,R0912,W0511"


"remaps
"<Esc>x2 to save the file
inoremap <Esc><Esc> <Esc>:w<CR>
noremap <leader>l :ls<CR>:b<space>


"Run a script to run tests on save
autocmd BufWritePost * silent !tmux send-keys -t 0 testme C-m
