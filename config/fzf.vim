nnoremap <leader>f :FZFFiles<cr>
nnoremap <leader>m :FZFHistory<cr>
nnoremap <leader>F :FZFBTags<cr>
nnoremap <leader>S :FZFTags<cr>
nnoremap <leader>L :FZFLines<cr>
nnoremap <leader>b :FZFBuffers<cr>
nnoremap <leader>C :FZFColors<cr>
nnoremap <leader>G :FZFRg<space>
nnoremap <leader>: :FZFHistory:<cr>
nnoremap <leader>? :FZFHistory/<cr>
nnoremap <leader><c-j> :FZFSnippets<cr>
nnoremap <leader>d :FZFCommands<cr>

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

