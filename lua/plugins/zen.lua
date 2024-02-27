return {
  "folke/zen-mode.nvim",
  event = 'VeryLazy',
  config = function()
  require("zen-mode").setup {
      plugins = {
          tmux = { enabled = false },
          alacritty = { enabled = false, font = "13" },
      }
  }
  end,
}
