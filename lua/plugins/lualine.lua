return {
  'nvim-lualine/lualine.nvim',
--  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
     require("lualine").setup({
        options = { theme = 'gruvbox' },
        inactive_sections = {
          lualine_b = {'branch'},
          lualine_c = { { 'filename', file_status = true, path = 1 }}
        },
        sections = {
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
          }
        }
      })
    end,
}
