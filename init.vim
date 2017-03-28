execute pathogen#infect()
syntax on
filetype plugin indent on

:colorscheme molokai

:inoremap jk <esc>
:set incsearch
:set hlsearch
:noremap <C-l> :<C-u>nohlsearch<CR><C-l>
:set clipboard=unnamed
:vmap <C-c> y<Esc>i
:vmap <C-x> d<Esc>i
:imap <C-v> <Esc>pi
:imap <C-y> <Esc>ddi
:map <C-z> <Esc>
:imap <C-z> <Esc>ui
