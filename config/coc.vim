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

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

highlight link CocErrorSign GruvboxRed

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    call CocAction('doHover')
endfunction


autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Remap for format selected region
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" :CocInstall coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

  " let g:coc_global_extensions = [
  "     \'coc-markdownlint',
  "     \'coc-highlight',
  "     \'coc-vetur',
  "     \'coc-go',
  "     \'coc-python',
  "     \'coc-explorer',
  "     \'coc-flutter', 
  "     \'coc-json', 
  "     \'coc-git'
  "     \]
