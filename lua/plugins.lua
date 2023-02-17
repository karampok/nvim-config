-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use('tpope/vim-fugitive')
  use 'tpope/vim-rhubarb'
  use({
    "folke/which-key.nvim",
    config = get_config("which"),
  })

  use({
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    event = "VimEnter",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use "morhetz/gruvbox"
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-github.nvim',
      'nvim-telescope/telescope-packer.nvim',
    },
    config = get_config("telescope"),
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'RRethy/nvim-treesitter-endwise',
      'andymass/vim-matchup', -- extend % key
      'yioneko/nvim-yati',
    },
    config = get_config("treesitter"),
  })

  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
    },
    config = get_config("cmp"),
  })


  use({
    'ray-x/go.nvim',
    requires = {
      'ray-x/guihua.lua',
    },
    config = get_config("ray-x"),
  })

  use({
    'junnplus/lsp-setup.nvim',
    -- '~/Documents/workspace/nvim-lsp-setup',
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'folke/lsp-colors.nvim',
      'folke/neodev.nvim',
      'ray-x/lsp_signature.nvim',
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      -- 'simrat39/rust-tools.nvim',
      -- 'p00f/clangd_extensions.nvim',
      -- 'lukas-reineke/lsp-format.nvim',
      -- 'lvimuser/lsp-inlayhints.nvim',
    },
    config = get_config("lsp"),
  })

  use {
    'nvim-orgmode/orgmode',
    branch = 'master',
    config = get_config("orgmode"),
  }

  use({
    'vimwiki/vimwiki', branch = 'dev',
    requires = {},
    config = get_config("vimwiki"),
  })

  use({
    'ellisonleao/glow.nvim',
    requires = {},
    config = get_config("glow"),
  })


  use 'tpope/vim-commentary'
  -- use "sbdchd/neoformat"
  -- use 'tpope/vim-fugitive'

  -- use 'mattn/vim-gist'
  -- use 'mattn/webapi-vim'

  -- use "junegunn/goyo.vim"
  -- use "junegunn/limelight.vim"
  -- use 'beauwilliams/focus.nvim'
  -- use({ "folke/which-key.nvim", config = get_config("which") })
  -- use 'folke/trouble.nvim"'

  -- use {
  --     'npxbr/glow.nvim',
  --     cmd = { 'Glow', 'GlowInstall' },
  -- }
  -- use 'weirongxu/plantuml-previewer.vim'
  -- use 'tyru/open-browser.vim'
  -- use 'aklt/plantuml-syntax'
end
)



require('go').setup()
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require 'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'org' }, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = { 'org' }, -- Or run :TSUpdate org
}
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
