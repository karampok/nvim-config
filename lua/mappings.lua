local vim = vim
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("", "<leader>q", ":q!<cr>")
map("n", "<C-l>", "<cmd>noh<CR>") -- Clear highlights
map("i", "jk", "<Esc>") -- jk to escape

map("", "<leader>f", "<cmd>Telescope find_files<cr>")
map("", "<leader>b", "<cmd>Telescope buffers<cr>")
map("", "<leader>r", "<cmd>Telescope live_grep<cr>")


local remap = vim.api.nvim_set_keymap

-- Stay centered
remap('n', 'n', 'nzzzv', { noremap = true })
remap('n', 'N', 'Nzzzv', { noremap = true })
-- Let the cursor stay where it is for joins
remap('n', 'J', 'mzJ`v', { noremap = true })

-- clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
