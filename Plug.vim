call plug#begin('~/.config/nvim/plugged')
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let g:fzf_command_prefix = 'FZF'
"let g:fzf_layout = { 'down': '~20%' }

Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/gitspace/vimwiki', 'syntax': 'markdown', 'ext': '.wiki.md'}]

Plug 'ntpeters/vim-better-whitespace'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'go']

Plug 'shime/vim-livedown'
Plug 'zhou13/vim-easyescape'
Plug 'itchyny/lightline.vim'

Plug 'pedrohdz/vim-yaml-folds'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

let g:deoplete#enable_at_startup =1
let g:deoplete#enable_at_startup = 1
let g:neopairs#enable = 1
call plug#end()


call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
