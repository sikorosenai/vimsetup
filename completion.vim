Plugin 'Rip-Rip/clang_complete'
Plugin 'lifepillar/vim-mucomplete'

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

set completeopt+=menuone

inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

