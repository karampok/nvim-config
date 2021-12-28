local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("", "<leader>c", '"+y') -- Copy to clipboard in normal, visual, select and operator modes
--map("", "<leader>w", ":w<cr>")
--map("", "<leader>e", ":e<cr>")
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

remap('n', '<leader>q', "<cmd>lua require'utils'.toggle_qf('q')<CR>", { noremap = true })
remap('n', '[q', ':cprevious<CR>',      { noremap = true })
remap('n', ']q', ':cnext<CR>',          { noremap = true })
remap('n', '[Q', ':cfirst<CR>',         { noremap = true })
remap('n', ']Q', ':clast<CR>',          { noremap = true })

-- Location list mappings
-- remap('n', '<leader>Q', "<cmd>lua require'utils'.toggle_qf('l')<CR>", { noremap = true })
-- remap('n', '[l', ':lprevious<CR>',      { noremap = true })
-- remap('n', ']l', ':lnext<CR>',          { noremap = true })
-- remap('n', '[L', ':lfirst<CR>',         { noremap = true })
-- remap('n', ']L', ':llast<CR>',          { noremap = true })

-- Search and Replace
-- 'c.' for word, '<leader>c.' for WORD
remap('n', 'c.',         [[:%s/\<<C-r><C-w>\>//gc<Left><Left>]], { noremap = true })
remap('n', '<leader>c.', [[:%s/\<<C-r><C-a>\>//gc<Left><Left>]], { noremap = true })
