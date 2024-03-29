return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim" ,
      "nvim-treesitter/nvim-treesitter",
--      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      local actions = require("telescope.actions")
      require('telescope').load_extension('projects')
      require("telescope").setup({
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
          },
          grep_string = {
            additional_args = {'--hidden'}
          },
          live_grep = {
            additional_args = {'--hidden'}
          }
        },
        defaults = {
           file_ignore_patterns = { "vendor/" },
          layout_strategy = "vertical",
          layout_config = {
                vertical = { prompt_position = "bottom", mirror = true },
           },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ['<C-f>'] = actions.preview_scrolling_down,
              ['<C-b>'] = actions.preview_scrolling_up,
            },
          },
        },

      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      -- require('telescope').load_extension('fzf')
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      -- require("telescope").load_extension("ui-select")
      --
      })
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    end,
  }
