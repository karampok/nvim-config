return {
  'folke/which-key.nvim',
  event = 'BufEnter',

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    vim.keymap.set('n', '<leader>,', ":WhichKey<CR>")
    vim.keymap.set('n', '<leader><leader>', ":Telescope<CR>")

    local wk = require('which-key')
    wk.setup({})
    wk.register({
      ['<leader>'] = {
        g = { name = 'git' },
        m = { name = 'Trouble' },
      },
      g = { name = 'Movements/LSP'},
    })
  end,
}
