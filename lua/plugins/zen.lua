return {
  "folke/zen-mode.nvim",
  event = 'VeryLazy',
  config = function()
  local oldwrap = vim.wo.wrap
  require("zen-mode").setup {
      window = {
        options = {
           number = false,
           cursorline = true,
           cursorcolumn = false,
           relativenumber = true,
           list = false,
           signcolumn = "no",
        }
      },
      plugins = {
          tmux = { enabled = false },
          alacritty = { enabled = false, font = "13" },
      },
      on_open = function(win)
        oldwrap = vim.wo.wrap
        vim.wo.wrap = true
      end,
      on_close = function()
          vim.wo.wrap = oldwrap
      end,
  }
  end,
}
