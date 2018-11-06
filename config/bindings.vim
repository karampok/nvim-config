" ----------------------------------------
" Bindings
" ----------------------------------------
let g:mapleader=','
let g:maplocalleader = '-'

set pastetoggle=<F6>
map <F6> :set invpaste<CR>:set paste?<CR>

" Common typos {{{
command! W w
command! Q q
command! WQ wq
command! Wq wq

" :inoremap <esc> <nop>
cnoremap jk <ESC>
cnoremap kj <ESC>

map <leader><leader> :bp<cr>

" }}}
" Spelling {{{
" Toggle spelling mode with ,s
" nmap <silent> ss :set spell!<CR>
" nmap <silent> <leader>sf :QuickSpellingFix<CR>
" }}}
