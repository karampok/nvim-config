let g:vimwiki_list = [{'path': '~/.vimwiki', 'syntax': 'markdown', 'ext': '.wiki.md'}]
let g:vimwiki_url_maxsave=0

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

nnoremap <leader>c :call ToggleCalendar()<CR>
nnoremap <leader>tt :VimwikiToggleListItem <CR>

au BufNewFile *diary/2*.wiki.md :silent 0r !~/bin/generate-vimwiki-diary-template.py '%'
