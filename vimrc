"pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()


"options
set nocompatible
filetype plugin indent on
set relativenumber
set number "Current line will display its real number.
set nobackup
set autochdir "current file's path as working directory
set fileformats=unix,dos
set completeopt=menuone,longest
set wildmenu
set wildmode=longest:full,full
set laststatus=2
set nowritebackup
set hidden


"indentation
set expandtab
set shiftwidth=4
set softtabstop=4 " <BS> deletes indentation.
set autoindent
"
"this should remove any extra white space
"on the document before saving
autocmd! BufWritePre * :%s/\s\+$//e

"unfold markdown
autocmd! BufRead *.md normal zR

"fonts and colors
syntax on
colorscheme jellybeans

if has("unix")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
elseif has("win32")
    set guifont=Consolas:h11:cANSI
endif

"Increase or decrease font size
if  has("gui_running")
    nnoremap <C-Up> :silent let &guifont=substitute(&guifont, '\zs\d\+', '\=submatch(0)+1', '')<CR>
    nnoremap <C-Down> :silent let &guifont=substitute(&guifont, '\zs\d\+', '\=submatch(0)-1', '')<CR>
endif


"search
set ignorecase
set smartcase
set hlsearch
set incsearch

"UltiSnips
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsListSnippets = '<c-l>'
let g:UltiSnipsEditSplit="horizontal"

"python
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_checkers=['pyflakes', 'pep8']
"Suppress errors
"Ignore lines > 79 chars
"pylint lines > 80
"Docstrings
"Access protected method
"Abstract method not overridden
"Too many local variables
"Too many branches
"TODO_text
"Locally disabling an error
let g:pymode_lint_ignore = "E501,C0301,C0110,W0212,W0223,R0914,R0912,W0511,I0011"


"remaps
let mapleader=" "
noremap ; :
noremap : ;
"<Esc>x2 to save the file
inoremap <Esc><Esc> <Esc>:w<CR>
noremap <Esc><Esc> :w<CR>
"List buffers
noremap <leader>l :ls<CR>:b<space>
"Copy to the clipboard
if has("unix") && system("uname -s") == "Darwin"
    vnoremap <Leader>y :<Home>silent <End>w !pbcopy<CR>
else
    "linux
    vnoremap <Leader>y "+y
endif
"Paste from the clipboard
noremap <Leader>p "+p
noremap <Leader>P "+P

"esc and save from insert mode
inoremap jj <Esc>
inoremap jk <Esc>:w<CR>

"Run a script to run tests on save
" autocmd! BufWritePost * silent !tmux send-keys -t 0 testme C-m
let g:testme = 0
nnoremap <Leader>t :call TestToggle()<CR>
function! TestToggle()
    if g:testme
        let g:testme = 0
    else
        let g:testme = 1
    endif
endfunction

autocmd! BufWritePost * call Testme()
function! Testme()
    if g:testme
        if exists("g:panel")
            silent execute "!tmux send-keys -t main:" . g:panel . " testme C-m"
        else
            echo 'set g:panel or will use "2.0" next time.'
            let g:panel="2.0"
        endif
    endif
endfunction
