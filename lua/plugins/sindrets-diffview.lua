return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen' },

  config = function()
    require('diffview').setup({
      use_icons = false,
    })
  end
}
