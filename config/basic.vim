" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" Config {{{
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/.undo
endif

" We rely on bash for some things, make sure we use that for shelling out
set shell=/bin/bash

" Prevent netrw buffers from being set as alternate
let g:netrw_altfile = 1
" }}}

" Backups {{{
set swapfile                    " Keep swapfiles
set directory=~/.config/nvim/.tmp
set backupdir=~/.config/nvim/.tmp
set viewdir=~/.local/share/nvim/view
" }}}

" UI {{{
set numberwidth=4
" }}}

" Behaviors {{{
set wildmode=list:longest " use emacs-style tab completion when selecting files, etc
set foldlevelstart=99
set formatoptions=crql
set iskeyword+=$,@,-     " Add extra characters that are valid parts of variables
set tags=./tags;/,tags;/
set viewoptions=cursor,folds,slash,unix
set scrolloff=5
set tabstop=4 shiftwidth=4 expandtab
" }}}


" Searching {{{
if executable('rg')
  set grepprg=rg\ --vimgrep
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
elseif executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif
" }}}

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

set mmp=160000
