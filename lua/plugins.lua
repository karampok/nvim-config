require("packer").startup(
    function()
        use "wbthomason/packer.nvim"
        use "hoob3rt/lualine.nvim"
        use "morhetz/gruvbox"

        use "nvim-telescope/telescope.nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"

        use "sbdchd/neoformat"
        use "neovim/nvim-lspconfig"
        use "glepnir/lspsaga.nvim"
        use "nvim-treesitter/nvim-treesitter"
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'tpope/vim-commentary'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'ray-x/lsp_signature.nvim'

        use 'mattn/vim-gist'
        use 'mattn/webapi-vim'

        --   use 'airblade/vim-gitgutter",
        use "junegunn/goyo.vim"
        use "junegunn/limelight.vim"

        use  'beauwilliams/focus.nvim'
        use  {'vimwiki/vimwiki',  branch = 'dev'}

                use 'folke/which-key.nvim'
        use 'kyazdani42/nvim-web-devicons'
        -- use 'folke/trouble.nvim"'

        use {
            'npxbr/glow.nvim',
            cmd = { 'Glow', 'GlowInstall' },
        }
        use 'weirongxu/plantuml-previewer.vim'
        use 'tyru/open-browser.vim'
        use 'aklt/plantuml-syntax'
    end
)

require("lualine").setup { options = {theme = "gruvbox"} }
require("focus").setup({number = true})
require("which-key").setup()
--require("trouble").setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}


local saga = require 'lspsaga'
saga.init_lsp_saga()
