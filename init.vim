" Setup {{{1
set nocompatible

" GVim required the runtime path to contain the startup script folder
let &runtimepath.=','.escape(expand('<sfile>:p:h'), '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/colors', '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/bundle/Vundle.vim', '\,')
let &runtimepath.=','.escape(expand('<sfile>:p:h').'/bundle', '\,')
filetype off
call vundle#begin()

let loaded_matchit = 1
let g:python3_host_prog=$MYPYTHON3
let g:python_host_prog=$MYPYTHON2

" Plugins {{{1
Plugin 'VundleVim/Vundle.vim'          " Plugin Manager
Plugin 'tpope/vim-fugitive'            " Git support
Plugin 'scrooloose/nerdtree'           " Tree browser
"Plugin 'scrooloose/nerdcommenter'      " Comment code sections
Plugin 'tpope/vim-surround'            " Surround section with ', etc.
Plugin 'tpope/vim-unimpaired'          " Useful mappings ([<space etc)
Plugin 'bling/vim-airline'             " Fancy status bar
Plugin 'airblade/vim-gitgutter'        " git info in the gutter, hunk
Plugin 'easymotion/vim-easymotion'     " easy jumping around - ,,w
Plugin 'derekwyatt/vim-fswitch'        " Switch between cpp/header. FSHere, FSRight
Plugin 'mtth/scratch.vim'              " gs scratch window
Plugin 'ctrlpvim/ctrlp.vim'            " Fuzzy tag/file search
Plugin 'kien/rainbow_parentheses.vim'  " Color brackets
Plugin 'dahu/VimRegexTutor'            " Regex tutorial; need to do this
Plugin 'vim-scripts/mru.vim'           " :MRU
Plugin 'jlanzarotta/bufexplorer'       " :be
Plugin 'skywind3000/asyncrun.vim'
Plugin 'szw/vim-maximizer'             " F3 to min/max the current buffer
Plugin 'junegunn/vim-easy-align'
Plugin 'RRethy/vim-illuminate'

"Swift
Plugin 'keith/swift.vim'

"C++
"Plugin 'JBakamovic/cxxd-vim'

" Completion
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'deoplete-plugins/deoplete-clang'

" Wiki
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/calendar-vim'

Plugin 'OrangeT/vim-csharp'
Plugin 'markonm/traces.vim'
"Plugin 'tpope/vim-dispatch'

" Use FZF for searching in files using Rg
Plugin 'junegunn/fzf'                  " Fuzzy finder
Plugin 'junegunn/fzf.vim'              " Fuzzy finder vim extension

" Session stuff haven't ever used
Plugin 'tpope/vim-obsession'

" ?
Plugin 'kovisoft/slimv'

" Tab for completion
Plugin 'ervandew/supertab'

" Haskell
"Plugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
"Plugin 'neovimhaskell/haskell-vim'
"Plugin 'alx741/vim-hindent'

" Clojure
"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-fireplace'                        " clojure list repl
"Plugin 'guns/vim-clojure-highlight'                 " Syntax highlight

" Pico 8
"Plugin 'justinj/vim-pico8-syntax'

" Linux TBD
"Plugin 'jalcine/cmake.vim'
"Plugin 'dhruvasagar/vim-prosession'

"Plugin 'w0rp/ale'
"Plugin 'autozimu/LanguageClient-neovim'
"Plugin 'parsonsmatt/intero-neovim'
Plugin 'neomake/neomake'
"Plugin 'bitc/vim-hdevtools'
"
Plugin 'mh21/errormarker.vim'

" Thanks to https://forums.handmadehero.org/index.php/forum?view=topic&catid=4&id=704#3982
" error message formats
" Microsoft MSBuild
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
" Microsoft compiler: cl.exe
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
" Microsoft HLSL compiler: fxc.exe
set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m

let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
call vundle#end()
filetype plugin indent on
filetype plugin on

" Deoplte {{2
let g:deoplete#enable_at_startup = 1

" Haskell {{2
let g:ghcid_keep_open = 1
" ----- neovimhaskell/haskell-vim -----

" Align 'then' two spaces after 'if'
let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0

" ----- hindent & stylish-haskell -----
" Indenting on save is too aggressive for me
let g:hindent_on_save = 0 

" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

" Key bindings
augroup haskellStylish
  au!
  " Just hindent
  au FileType haskell nnoremap <leader>hi :Hindent<CR>
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
  " First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')<CR>
augroup END

" ----- w0rp/ale -----
"let g:ale_linters.haskell = ['hlint']

" ASyncRun {{
:noremap <Leader>b :AsyncRun cd <root>/build && cmake --build . <cr>
:noremap <F8> :cnext <cr>

augroup vimrc
autocmd QuickFixCmdPost * botright copen 8
augroup END<cr> 

" FSwitch {{{2
let g:fsnonewfiles=1
au! BufEnter *.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = 'reg:|src|include/zep|,../Inc/**/,source'
au! BufEnter *.h let b:fswitchdst = 'cpp' | let b:fswitchlocs = 'reg:|include.*zep|src|,../../Src/,source'

" Prosession {{{2
let g:prosession_dir=$MYDROPBOX.'/.vim/session'

" Fuzzy Finder {{{2

" Rainbow Parentheses {{{2
try
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
catch
endtry

" Clang Completion {{{2
let g:clang_library_path=expand("$MYDROPBOX/Dev/bin")
set noshowmode shortmess+=c
set noinfercase
set completeopt-=preview
set completeopt+=menuone,noinsert,noselect
" The following line assumes `brew install llvm` in macOS
let g:clang_user_options = '-std=c++17'
let g:clang_hl_errors = 1
let g:clang_complete_auto = 1
let g:mucomplete#enable_auto_at_startup = 1
"These broke VC; what were they for?
"inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
"inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
"inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

" NERDTree {{{2
let NERDTreeHijackNetrw=1

" CtrlP {{{2
set grepprg=rg\ --color=never
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_root_markers = ['Grfx']
set wildignore+=*/.git/*,*/tmp/*,*.swp

nnoremap <Leader>g :silent lgrep<Space>

" RipGrep {{{2
let g:ackprg = 'rg --vimgrep --no-heading'

" Syntastic {{{2
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"set statusline+=%{fugitive#statusline()}
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

" Minibuf Explorer {{{2
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" VimWiki {{{2
let g:vimwiki_list = [{'path': $MYDROPBOX.'/vimwiki/'},
            \   {'path': $MYDROPBOX.'/techwiki/'}]

au BufRead,BufNewFile *.wiki set filetype=vimwiki
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

:map >> <Plug>VimwikiIncreaseLvlSingleItem
:map >>> <Plug>VimwikiIncreaseLvlWholeItem
:map << <Plug>VimwikiDecreaseLvlSingleItem
:map <<< <Plug>VimwikiDecreaseLvlWholeItem

" VimScratch {{{2
let g:scratch_persistence_file=$MYDROPBOX.'/vimscratch.txt'


command! MakeTags !ctags -R .
command! Bigger  :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)+1', '')
command! Smaller :let &guifont = substitute(&guifont, '\d\+$', '\=submatch(0)-1', '')

" Leaders {{{1

" ** Leader keys Comma is easier to reach
let mapleader = ","

" Searching
nnoremap <Leader>, :Find <CR>
nnoremap <Leader>. :CtrlPTag<cr>

" Remove all white space trailing
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"nnoremap <leader>B <C-w>\|
"nnoremap <leader>S <C-w>=

" Tag list and tag jump
nnoremap <Leader>gt g<C-]>
nnoremap <Leader>t <C-]>

" Reselect text that was just pasted
nnoremap <leader>v V`]

"nnoremap <leader>fp :args **/*.vcxproj<cr>:silent! argdo %s/<ClCompile.*\.h.*//g<cr>

nnoremap <Leader>f :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>
" switch to a second window
"nnoremap <leader>ws <c-w>v<c-w>l

" Remove highlight selection
nnoremap <leader><space> :noh<cr>

" Replace with last yanked
nnoremap <leader>s diw"0P

" Replace word under cursor
nnoremap <Leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <Leader>n :Scratch<cr>

nnoremap <Leader>. :CtrlPTag<cr>
"nnoremap <leader>sw :call SetGitDir()<CR>

" Edit in window at current directory
" Edit in split at current directory
" Open VimRC in window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>es :vsp <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

command! MakeTags !ctags -R .

" Options {{{1
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
set foldmethod=marker
set equalalways
set termguicolors

"vimwiki
set nocompatible
syntax on

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

" Use system clipboard
:set clipboard=unnamed

set guifont=Consolas:h11:cANSI

" Dark goodness
set background=dark

colorscheme molokai

" Mappings {{{1
" My prefered escape character (j then k)
inoremap jk <esc>
tnoremap jk <C-\><C-n>

" Move by buffer lines
nnoremap j gj
nnoremap k gk
nnoremap gk k
nnoremap gj j

"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" H and L for tab switching
nnoremap H gT
nnoremap L gt

" F9 folds
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Swap files between source header
map <C-k><C-o> :FSHere<CR>
map <C-k><C-o> :FSHere<CR>
map <C-k><C-l> :FSRight<CR>
map <C-k><C-v> :FSSplitRight<CR>
map <C-k><C-W> :FSLeft<CR>

" File tree, Tagbar tree
map <C-t> :NERDTreeToggle<CR>
"map <C-T> :TagbarToggle<CR>
"map <C-p> :CtrlPMixed<CR>
"nnoremap <C-i> :CtrlPTag<CR>

vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
"imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

" Control + motion for window move
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" conflict with searches.  Used to switch windows while editing
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

nnoremap <C-k><C-d> gg=G''

" Tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
let notabs = 0
nnoremap <silent> <F6> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
" Auto Commands {{{1
autocmd FileType c,cpp setlocal equalprg=clang-format
autocmd GUIEnter * simalt ~x

" Save when focus is lost
autocmd FocusLost * :wa

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

" Functions {{{1
function! SetGitDir()
    " Change working dir to the current file
    cd %:p:h
    " Set 'gitdir' to be the folder containing .git
    let gitdir=system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let isnotgitdir=matchstr(gitdir, '^fatal:.*')
    " If it empty, there was no error. Let's cd
    if empty(isnotgitdir)
        cd `=gitdir`
    endif
endfunction

nnoremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" }}} vim: fdm=marker
