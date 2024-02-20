return {
  'nvim-tree/nvim-tree.lua',
  event = 'VeryLazy',
  config = function()
    require('nvim-tree').setup({
      renderer ={
        icons = {
          glyphs ={},
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            modified = false,
            diagnostics = false,
            bookmarks = false,
          }
        }
      },
      view = {
        side = "right",
        adaptive_size = true,
      },
    })
    vim.keymap.set('n', '<leader>d', ':NvimTreeToggle<CR>')
  end,
}
