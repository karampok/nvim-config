   " nnoremap <Up> :tabs<CR>
  " nnoremap <Down> :windo bd<CR>


" if &diff
  " syntax off
" endif
"
"
if &diff
  nnoremap <Leader>q :qa<CR>
  set diffopt=internal,filler,iwhite,context:5
  hi DiffChange cterm=none ctermfg=none ctermbg=none guibg=none gui=none  guifg=none
  "hi DiffText   cterm=none ctermfg=none ctermbg=none guifg=Green guibg=none gui=none
  "hi DiffAdd    cterm=none ctermfg=none ctermbg=none gui=none guifg=bg guibg=DarkGreen
  "hi DiffDelete cterm=none ctermfg=DarkRed ctermbg=none gui=none guifg=Red guibg=none
endif
