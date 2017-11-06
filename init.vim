set nocompatible

" GVim required the runtime path to contain the startup script folder
let &runtimepath.=','.escape(expand('<sfile>:p:h'), '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/colors', '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/bundle/Vundle.vim', '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/bundle', '\,')
filetype off
call vundle#begin()

let g:python3_host_prog='$MYPYTHON3'
let g:python_host_prog='$MYPYTHON2'

Plugin 'VundleVim/Vundle.vim'          " Plugin Manager
Plugin 'tpope/vim-fugitive'            " Git support
Plugin 'scrooloose/nerdtree'           " Tree browser
Plugin 'scrooloose/nerdcommenter'      " Comment code sections
Plugin 'tpope/vim-surround'            " Surround section with ', etc.
Plugin 'tpope/vim-unimpaired'
Plugin 'ctrlpvim/ctrlp.vim'            " Fuzzy tag/file search
Plugin 'bling/vim-airline'             " Fancy status bar
" Plugin 'majutsushi/tagbar'             " Side tag bar for ctags
Plugin 'airblade/vim-gitgutter'        " git info in the gutter, hunk
"Plugin 'valloric/youcompleteme'        " Code completion
Plugin 'easymotion/vim-easymotion'     " easy jumping around
" Plugin 'timburgess/extempore.vim'
Plugin 'derekwyatt/vim-fswitch'        " Switch between cpp/header
Plugin 'mtth/scratch.vim'              " gs scratch window
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fireplace'           " clojure list repl
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'guns/vim-sexp'                 " manage lisp sexp
"Plugin 'tpope/vim-sexp-mappings-for-regular-people' " handy mappings sexp
"Plugin 'junegunn/fzf'
"Plugin 'junegunn/fzf.vim'
"Plugin 'ntpeters/vim-airline-colornum'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'craigemery/vim-autotag'        " Doesn't work?

call vundle#end()
filetype plugin indent on

syntax on

" My prefered escape character (j then k)
:inoremap jk <esc>
:tnoremap jk <C-\><C-n>

" Force no use of arrows in normal mode
nnoremap j gj
nnoremap k gk
nnoremap gk k
nnoremap gj j

" Save when focus is lost
au FocusLost * :wa

try
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
catch
endtry

" ** Leader keys Comma is easier to reach
let mapleader = ","

" Remove all white space trailing
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Tag list and tag jump
nnoremap <Leader>gt g<C-]>
nnoremap <Leader>t <C-]>

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

command! MakeTags !ctags -R .

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

" Breaks vis white space
set nocursorline
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

" Swap files between source header
:map <C-k><C-o> :FSHere<CR>
:map <C-k><C-o> :FSHere<CR>
:map <C-k><C-w> :FSRight<CR>
:map <C-k><C-W> :FSLeft<CR>

" File tree, Tagbar tree
:map <C-T> :NERDTreeToggle<CR>
":map <C-T> :TagbarToggle<CR>
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

" Control + motion for window move
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Minibuf explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

autocmd FileType c,cpp setlocal equalprg=clang-format
nnoremap <C-k><C-d> gg=G''

set guifont=Consolas:h11

" Dark goodness
set background=dark
colorscheme molokai

autocmd GUIEnter * simalt ~x

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --no-ignore --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!tags" --color "always" '.shellescape(<q-args>), 1, <bang>0)

