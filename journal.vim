au BufNewFile *diary/20*.wiki.md :silent 0r !generate-vimwiki-week '%'
let g:vimwiki_list = [
    \  {'path': '~/myspace/rh-vimwiki', 
    \   'syntax': 'markdown', 'ext': '.wiki.md',
    \   'diary_frequency': 'weekly',
    \   'diary_start_week_monday': 1}
    \]
let g:vimwiki_url_maxsave=0
let g:vimwiki_listsyms = '✗○◐●✓'


command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

" function! ToggleCalendar()
"   execute ":Calendar"
"   if exists("g:calendar_open")
"     if g:calendar_open == 1
"       execute "q"
"       unlet g:calendar_open
"     else
"       g:calendar_open = 1
"     end
"   else
"     let g:calendar_open = 1
"   end
" endfunction

" nnoremap <leader>c :call ToggleCalendar()<CR>
autocmd FileType vimwiki nmap <leader><space> <Plug>VimwikiToggleListItem

" VimwikiToggleListItem.

