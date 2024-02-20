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
        defaults = {
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
    end,
  }
