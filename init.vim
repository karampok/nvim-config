if !has('nvim-0.5')
  echohl Error
  echomsg "nvim-lua requires neovim > v0.5, no config will be loaded"
  echohl clear
  " do not load any plugins, equivalent to '--noplugin'
  set nolpl
  " use our embark color scheme
  set termguicolors
  finish
end


lua require('init')
lua require('plugins')
lua require('mappings')
lua require('autocmds')
lua require('lsp')

runtime! journal.vim

" Add format option 'w' to add trailing white space, indicating that paragraph
" continues on next line. This is to be used with mutt's 'text_flowed' option.
" https://brianbuccola.com/line-breaks-in-mutt-and-vim/
" https://incenp.org/notes/2020/format-flowed-neomutt-vim.html
au BufNewFile,BufRead neomutt-* setf mail
augroup mail_trailing_whitespace " {
    autocmd!
    autocmd FileType mail setl fo+=watqc tw=72 nojs nosmartindent
augroup END " }

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
    \  1,
    \  0
    \)