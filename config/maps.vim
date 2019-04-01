"=====================================================
"===================== MAPPINGS ======================
let mapleader = ","

" Some useful quickfix shortcuts for quickfix
map <C-n> :cn<CR>
map <C-p> :cp<CR>
nnoremap <leader>a :cclose<CR>

" put quickfix window always to the bottom
augroup quickfix
    autocmd!
    autocmd FileType qf wincmd J
    autocmd FileType qf setlocal wrap
augroup END
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

nnoremap <leader>w :w<cr>
nnoremap <silent> <leader>q :q!<CR>

" Remove search highlight
" nnoremap <leader><space> :nohlsearch<CR>
function! s:clear_highlight()
  let @/ = ""
  call go#guru#ClearSameIds()
endfunction
nnoremap <silent> <leader><space> :<C-u>call <SID>clear_highlight()<CR>

nnoremap <silent> <F5> :source ~/.config/nvim/init.vim<CR>

" Keeps search terms in the middle of vim buffer
nnoremap n nzzzv
nnoremap N Nzzzv

" inoremap <esc> <nop>
cnoremap jk <ESC>
cnoremap kj <ESC>

map <leader><leader> :bp<cr>


"TODO.
"nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
