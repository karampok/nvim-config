" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes


nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" inoremap <silent><expr> <space>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<space>" :
"       \ coc#refresh()
"
"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <space> pumvisible() ? "\<C-y>" : "\<space>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
" noremap <silent><expr> <c-space> coc#refresh()

highlight link CocErrorSign GruvboxRed


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Remap for format selected region
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
