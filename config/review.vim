  " hi DiffText   cterm=none ctermfg=Yellow ctermbg=none gui=none guifg=LightYellow guibg=none
  " hi DiffChange cterm=none ctermfg=Blue ctermbg=none gui=none guifg=Blue guibg=none
  " hi DiffAdd    cterm=bold ctermfg=Green ctermbg=none gui=none guifg=bg guibg=Red
  " hi DiffDelete cterm=bold ctermfg=DarkRed ctermbg=none gui=none guifg=Red guibg=none
  " nnoremap <Up> :tabs<CR>
  " nnoremap <Down> :windo bd<CR>


" if &diff
  " syntax off
" endif
"
"
if &diff
  syntax off
  set cursorline
  "set nofoldenable
  "au BufRead * normal zR

  nnoremap <Left> :tabp<CR>
  nnoremap <Right> :tabn<CR>

  nnoremap <Up> [czz
  nnoremap <down> ]czz
  nnoremap <Leader>q :windo bd<CR>

  set diffopt+=iwhite

  "hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
  hi DiffChange ctermbg=none  guibg=none gui=none   cterm=none
  hi DiffDelete ctermbg=none  guibg=none gui=none   cterm=none
  "hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none

  "nnoremap ] ]czz
  "nnoremap [ [czz
  "map ]c ]czz
    " map [ [czz
endif
