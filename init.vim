set nocompatible

" GVim required the runtime path to contain the startup script folder
let &runtimepath.=','.escape(expand('<sfile>:p:h'), '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h/colors'), '\,')

execute pathogen#infect()

syntax on
filetype plugin indent on

" My prefered escape
:inoremap jk <esc>

" Force no use of arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Save when focus is lost
au FocusLost * :wa

" ** Leader keys **
let mapleader = ","

" Remove all white space trailing
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Todo - fix ripgrep
nnoremap <leader>a :rg

" Reselect text that was just pasted
nnoremap <leader>v V`]

" Open VimRC in window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Switch to a second window
nnoremap <leader>w <C-w>v<C-w>l

" Remove highlight selection
nnoremap <leader><space> :noh<cr>

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set list
set listchars=tab:>-,eol:\ ,space:.,nbsp:~,extends:$
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

" Breaks VC - adds an extra white box in vsvim
" set laststatus=2

set relativenumber
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Always use regex
nnoremap / /\v
vnoremap / /\v

" File tree, Tagbar tree
:map <C-n> :NERDTreeToggle<CR>
:map <C-t> :TagbarToggle<CR>

" Use system clipboard
:set clipboard=unnamed

:vmap <C-c> y<Esc>i
:vmap <C-x> d<Esc>i
:imap <C-v> <Esc>pi
:imap <C-y> <Esc>ddi
:map <C-z> <Esc>
:imap <C-z> <Esc>ui

" Control keys - not working?
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

set guifont=Consolas:h11

" Dark goodness
set background=dark
colorscheme molokai

