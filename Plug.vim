call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component': {
      \   'filename': '%f',
      \ }
      \ }



Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let g:fzf_command_prefix = 'FZF'
"let g:fzf_layout = { 'down': '~20%' }

Plug 'zhou13/vim-easyescape'
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'
Plug 'sebdah/vim-delve'
"let g:delve_use_vimux = 1


Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'

Plug 'shime/vim-livedown'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kshenoy/vim-signature'
" Plug 'jiangmiao/auto-pairs'
" let g:AutoPairsShortcutJump = '<C-l>'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'go']

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/committia.vim'
Plug 'samoshkin/vim-mergetool'
Plug 'manasthakur/vimsessionist'
let g:sessionist_directory = $HOME . '/.nvim-sessions'

Plug 'editorconfig/editorconfig-vim'

Plug 'simnalamburt/vim-mundo'

Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'google/vim-jsonnet'
Plug 'google/jsonnet'



Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
