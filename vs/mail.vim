" Add format option 'w' to add trailing white space, indicating that paragraph
" continues on next line. This is to be used with mutt's 'text_flowed' option.
" https://brianbuccola.com/line-breaks-in-mutt-and-vim/
" https://incenp.org/notes/2020/format-flowed-neomutt-vim.html
au BufNewFile,BufRead neomutt-* setf mail
autocmd Filetype mail call SetMailOptions()
function SetMailOptions()
    setl tw=72
    setl fo+=watqc 
    setl nojs 
    setl nosmartindent
    setl foldexpr=strlen(substitute(matchstr(getline(v:lnum),'\\v^\\s*%(\\>\\s*)+'),'\\s','','g')) 
    setl foldmethod=expr foldlevel=1 foldminlines=2
endfunction

