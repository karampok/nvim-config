-- PROVIDERS
vim.g.loaded_python_provider = 0 -- disable python2 support
vim.g.loaded_ruby_provider   = 0 -- disable ruby support
vim.g.loaded_perl_provider   = 0 -- disable perl support
vim.g.loaded_node_provider   = 0 -- disable nodejs support
vim.g.python3_host_prog      = '/usr/bin/python3'

-- FILES AND BACKUP
vim.o.backup       = false
vim.o.writebackup  = false -- do not backup file before write
vim.o.encoding     = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.fileformat   = 'unix' -- <nl> for EOL

-- TEXT FORMATTING
vim.o.joinspaces = true -- insert spaces after '.?!' when joining lines
vim.o.autoindent = true -- copy indent from current line on newline
vim.o.cindent    = true -- cindent: do c-style indenting

vim.o.tabstop     = 2 -- Tab indentation levels every two columns
vim.o.softtabstop = 2 -- Tab indentation when mixing tabs & spaces
vim.o.shiftwidth  = 2 -- Indent/outdent by two columns
vim.o.shiftround  = true -- Always indent/outdent to nearest tabstop
vim.o.expandtab   = true -- Convert all tabs that are typed into spaces
-- See 'listchars' to make Tabs visible!
vim.o.smarttab    = true -- Use tabs at the start of a line, spaces elsewhere

-- Make special characters visible to use on ':set list'
vim.o.list        = true
vim.opt.listchars = {
  tab     = '»·',
  trail   = '•',
  extends = '…',
  nbsp    = '‗',
}

vim.opt.fillchars = {
  fold = '-',
}

vim.o.showbreak = '↻ ' -- String to put at the start of lines that have been wrapped.

-- Options for the "text format" command ("gq")
--
-- t: format code
-- c: auto-wrap comments using textwidth
-- r: auto-insert the current comment leader after hitting <Enter>
-- o: auto-insert the current comment leader after hitting 'o' or 'O'
-- q: allow formatting comments with 'gq'
-- n: recognize numbered lists
-- j: remove comment leader when it makes sense
vim.opt.formatoptions = vim.opt.formatoptions
    + 't'
    + 'c'
    + 'r'
    + 'q'
    + 'n'
    + 'j'

-- Allow jump commands for left/right motion to wrap to previous/next line when
-- cursor is on first/last character in the line:
vim.o.whichwrap = vim.o.whichwrap .. '<,>,[,]'

vim.o.linebreak   = true -- do not break words on line wrap
vim.o.wrap        = false -- do not wrap long lines
vim.g.colorcolumn = '+1' -- set colorcolumn to textwidth + 1
vim.o.colorcolumn = vim.g.colorcolumn

-- COLORS
vim.o.background    = 'light'
vim.o.termguicolors = true

-- NEOVIM UI
vim.o.backspace      = 'indent,eol,start'
vim.o.number         = true -- show line numbers
vim.o.relativenumber = false -- show relative numbers from cursor postion
vim.o.ruler          = true -- show line,col at the cursor pos
vim.o.showcmd        = true -- show current command under the cmd line
vim.o.showfulltag    = true -- auto completion (great for programming)
vim.o.showmode       = true -- show current mode (insert, etc) under the cmdline
vim.o.splitbelow     = true -- ':new' ':split' below current
vim.o.splitright     = true -- ':vnew' ':vsplit' right of current
vim.o.scrolloff      = 3 -- min number of lines to keep between cursor and screen edge
vim.o.sidescrolloff  = 2 -- min number of cols to keep between cursor and screen edge
vim.o.mouse          = '' -- disable the mouse
vim.o.guicursor      = ''
vim.o.winminheight   = 1 -- Minimum hiehgt for a window
vim.o.updatetime     = 3000 -- Set a shorter update time for gitsigns
vim.o.errorbells     = false -- disable error bells (no beep/flash)
vim.o.hlsearch       = true -- highlight all text matching current search pattern
vim.o.incsearch      = true -- show search matches as you type
vim.o.inccommand     = 'nosplit' -- show search and replace in real time
vim.o.smartcase      = true -- case sensitive when search includes uppercase
vim.o.visualbell     = true
vim.o.wildmenu       = true
vim.o.undofile       = true
vim.o.wildmode       = 'longest:full,full' -- Use the cool tab complete menu
--vim.o.wildmode          = 'list:longest,full' -- Use the cool tab complete menu
vim.o.wildoptions    = 'pum' -- Show completion items using the pop-up-menu (pum)
vim.o.timeoutlen     = 500


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'noinsert,menuone,noselect'
-- Avoid showing message extra message when using completion
vim.o.shortmess   = vim.o.shortmess .. 'c'

-- vim clipboard copies to system clipboard
-- unnamedplus = use the + register (cmd-v paste in our term)
vim.o.clipboard  = 'unnamed'
vim.o.dictionary = '/usr/share/dict/words'

-- The silver searcher
--if require('utils').shell_type('rg') then
--    vim.o.grepprg = '/usr/bin/rg --vimgrep --no-heading --smart-case --hidden'
--    vim.o.grepformat = '%f:%l:%c:%m'
--end

-- MAPPINGS
-- https://coderwall.com/p/gdowew/vim-tip-map-leader-to-space
vim.api.nvim_set_keymap('n', '<space>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('x', '<space>', '<nop>', { noremap = true })
vim.g.mapleader = ' ' -- set map leader to space

--  PLUGINS
-- local disabled_built_ins = {
--   '2html_plugin',
--   'getscript',
--   'getscriptPlugin',
--   'gitcommit',
--   'logipat',
--   'netrw',
--   'netrwFileHandlers',
--   'netrwPlugin',
--   'netrwSettings',
--   'rrhelper',
--   'spellfile_plugin',
--   'tar',
--   'tarPlugin',
--   'vimball',
--   'vimballPlugin',
--   'zip',
--   'zipPlugin',
-- }
-- for _, plugin in pairs(disabled_built_ins) do
--   vim.g['loaded_' .. plugin] = 1
-- end

--vim.cmd "syntax enable"
vim.cmd "filetype plugin on"
