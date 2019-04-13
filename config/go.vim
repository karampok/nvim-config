let g:go_fmt_autosave = 1
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_fmt_experimental = 1
let g:go_fmt_options = {
  \ 'goimports': '-local do/',
  \ }

let g:go_term_enabled = 0
let g:go_term_mode = "split"
let g:go_term_height = 13

let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 0
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 0
let g:go_highlight_operators = 0
let g:go_highlight_types = 0
let g:go_highlight_function_calls = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_structs = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_format_strings = 1

let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_info_mode = "gocode"
let g:go_auto_sameids = 0

let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1

let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet']
let g:go_metalinter_deadline = "50s"
let g:go_metalinter_autosave_enabled = ['vet']


let g:go_modifytags_transform = 'camelcase'

let g:go_test_prepend_name = 1
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']

" let g:go_snippet_engine = 'ultisnips'

let s:go_tags_path = $HOME . '/.config/nvim/go/tags'
let g:go_bin_path = $HOME . '/.config/nvim/go/bin'
let $PATH .= ':' . g:go_bin_path

let g:ale_go_gometalinter_options =
      \ '--tests ' .
      \ '--fast ' .
      \ '--disable=gotype ' .
      \ '--disable=gotypex ' .
      \ '--exclude="should have comment" ' .
      \ '--exclude="error return value not checked \(defer"'

augroup config#go
  autocmd!
  autocmd Filetype go
    \ nmap <buffer> <leader>e <plug>(go-error) |
    \ nmap <buffer> gd <plug>(go-def) |
    \ nmap <buffer> <c-]> <plug>(go-def-vertical) |
    \ nmap <buffer> <leader>i <plug>(go-info) |
    \ nmap <buffer> <leader>r <Plug>(go-run) |
    \ nmap <buffer> <leader>t <Plug>(go-test) |
    \ nmap <buffer> <leader>c <Plug>(go-build) |
    \ command! -bang A call go#alternate#Switch(<bang>0, 'edit') |
    \ command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit') |
    \ command! -bang AS call go#alternate#Switch(<bang>0, 'split') |
    \ compiler go
  autocmd! BufEnter *.go
      \ setlocal foldmethod=syntax foldnestmax=1 foldcolumn=2 |
      \ setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

augroup END
