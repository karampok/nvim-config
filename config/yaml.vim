" disable fucking stupid yaml indenting logic
augroup kk_yml
  autocmd!
  autocmd FileType yaml setl indentkeys-=<:>
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yaml setlocal norelativenumber nocursorline
augroup END
