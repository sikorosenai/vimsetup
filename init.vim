execute pathogen#infect()

syntax on
filetype plugin indent on

let mapleader = ","

set nocompatible

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

set list
set listchars=tab:▸\ ,eol:¬,space:.
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
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Always use regex
nnoremap / /\v
vnoremap / /\v

:colorscheme molokai

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
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

