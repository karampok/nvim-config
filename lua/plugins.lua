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
        --   use "junegunn/goyo.vim"
        --   use "junegunn/limelight.vim"
        
        use  'beauwilliams/focus.nvim'
        use  {'vimwiki/vimwiki',  branch = 'dev'}

        use 'weirongxu/plantuml-previewer.vim'
        use 'tyru/open-browser.vim'
        use 'aklt/plantuml-syntax'

        use 'kyazdani42/nvim-web-devicons'
        use {
          "folke/trouble.nvim",
          requires = "kyazdani42/nvim-web-devicons",
          config = function()
            require("trouble").setup {
            }
          end
        }

        use {
          "folke/which-key.nvim",
          config = function()
            require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            }
          end
        }

        use {
            'npxbr/glow.nvim',
            cmd = { 'Glow', 'GlowInstall' },
        }
    end
)

require("plugins.nvim-treesitter")
require("lualine").setup { options = {theme = "gruvbox"} }
require("focus").setup({number = true})

    -- use {
	-- 'vimwiki/vimwiki',
	-- config = function()
	    -- vim.g.vimwiki_list = {
            -- {
                -- path = '~/gitspace/vimwiki',
                -- syntax = 'markdown',
                -- ext = '.wiki.md',
            -- }
	    -- }


    -- -- Commenting
    -- ---------------------------------------------
    -- use {
        -- 'winston0410/commented.nvim',
        -- config = 'require("plugins.commented")',
    -- }


    -- ---------------------------------------------
    -- -- Usability
    -- ---------------------------------------------
       -- -- Requires https://www.nerdfonts.com/
    -- use {
        -- 'hoob3rt/lualine.nvim',
        -- config = 'require("plugins.lualine")',
    -- }
    -- use {
        -- 'folke/which-key.nvim',
        -- config = 'require("plugins.which-key")',
    -- }

    -- ---------------------------------------------
    -- -- Colors
    -- ---------------------------------------------
    -- -- If treesitter and the colorscheme is loaded
    -- -- at VimEnter, rainbow paranthesis works
    -- use {
        -- "ellisonleao/gruvbox.nvim",
        -- requires = {"rktjmp/lush.nvim"},
        -- config = 'require("color.gruvbox")',
        -- event = 'VimEnter',
    -- }

    -- ---------------------------------------------
    -- -- Tools
    -- ---------------------------------------------
    -- -- TODO au BufNewFile *diary/2*.wiki.md :silent 0r !~/bin/generate-vimwiki-diary-template.py '%'
    -- use {
	-- 'vimwiki/vimwiki',
	-- config = function()
	    -- vim.g.vimwiki_list = {
            -- {
                -- path = '~/gitspace/vimwiki',
                -- syntax = 'markdown',
                -- ext = '.wiki.md',
            -- }
	    -- }
	-- end
    -- }
-- end

-- function Packer:init()
    -- if not self:is_installed() then
        -- if vim.fn.input("Install packer.nvim? (y/n) ") == "y" then
            -- execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
            -- execute("packadd packer.nvim")
            -- print("Successfully installed packer.nvim.")

            -- self:load_packer()
            -- packer.install()
        -- end
    -- end
-- end

-- function Packer:load_compile()
    -- if vim.fn.filereadable(compile_path) == 1 then
        -- vim.cmd("luafile " .. compile_path)
    -- else
        -- assert("Missing packer compile file Run PackerCompile Or PackerInstall to fix")
    -- end

    -- vim.cmd [[command! PackerInstall           lua require('plugins').install()]]
    -- vim.cmd [[command! PackerUpdate            lua require('plugins').update()]]
    -- vim.cmd [[command! PackerSync              lua require('plugins').sync()]]
    -- vim.cmd [[command! PackerClean             lua require('plugins').clean()]]
    -- vim.cmd [[command! -nargs=* PackerCompile  lua require('plugins').compile(<q-args>)]]
    -- vim.cmd [[command! PackerStatus            lua require('plugins').status()]]
    -- vim.cmd [[command! PackerProfile           lua require('plugins').profile_output()]]
    -- vim.cmd [[command! -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('plugins').loader(<q-args>)]]

    -- vim.cmd [[autocmd User PackerComplete lua require('plugins').compile()]]
-- end


-- local plugins = setmetatable({}, {
    -- __index = function(_, key)
        -- if not packer then
            -- Packer:load_packer()
        -- end
        -- return packer[key]
    -- end
-- })

-- function plugins.init()
    -- Packer:init()
    -- Packer:load_compile()
-- end

--return plugins
