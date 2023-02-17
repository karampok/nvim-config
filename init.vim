lua require('init')
lua require('plugins')
lua require('mappings')
lua require('autocmds')

set debug=msg
runtime! vs/journal.vim
runtime! vs/mail.vim


"au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
"    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
"    \  1,
"    \  0
"    \)
