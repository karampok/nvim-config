return {
  'nvim-telescope/telescope.nvim',
  keys = { '<leader>ff', '<leader>fg', '<leader>fb', ';' },
  dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-github.nvim',
        },
        config = function()
            require('plugins.telescope')
        end,
}
