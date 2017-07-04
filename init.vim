set nocompatible

" GVim required the runtime path to contain the startup script folder
let &runtimepath.=','.escape(expand('<sfile>:p:h'), '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/colors', '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/bundle/Vundle.vim', '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/bundle', '\,')
filetype off
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'valloric/youcompleteme'
Plugin 'easymotion/vim-easymotion'
" Plugin 'timburgess/extempore.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'mtth/scratch.vim' 
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

call vundle#end()
filetype plugin indent on

syntax on

" My prefered escape
:inoremap jk <esc>

" Force no use of arrows
nnoremap j gj
nnoremap k gk
nnoremap gk k
nnoremap gj j

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

" Replace with last yanked
nnoremap <leader>s diw"0P


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
set laststatus=2

set relativenumber
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Always use regex
nnoremap / /\v
vnoremap / /\v

" Swap files
:map <C-k><C-o> :FSHere<CR>

" File tree, Tagbar tree
:map <C-n> :NERDTreeToggle<CR>
:map <C-t> :TagbarToggle<CR>
:map <C-p> :CtrlPMixed<CR>
nnoremap <C-i> :CtrlPTag<CR>

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

" Minibuf explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

set guifont=Consolas:h11

" Dark goodness
set background=dark
colorscheme molokai

