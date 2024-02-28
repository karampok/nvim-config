return {
  'folke/which-key.nvim',
  event = 'BufEnter',

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    vim.keymap.set('n', '<leader>,', ":WhichKey<CR>")
    vim.keymap.set('n', '<leader><leader>', ":Telescope<CR>")
    vim.keymap.set('n', '<leader>p', ":Telescope projects<CR>")
    vim.keymap.set("n", "<leader>e", ":ZenMode<CR>", { desc = "ZEN" })

    local wk = require('which-key')
    wk.setup({
      plugins = {
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
    })
    wk.register({
      ['<leader>'] = {
        g = { name = 'git' },
        m = { name = 'Trouble' },
      },
      g = { name = 'Movements/LSP'},
    })
  end,
}
