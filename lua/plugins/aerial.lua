return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
--     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    require('aerial').setup({
      placement = "edge",
    })
  end,

}
