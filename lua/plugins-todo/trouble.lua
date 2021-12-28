if not pcall(require, "trouble") then
  return
end

require('trouble').setup()

local remap = vim.api.nvim_set_keymap
local opt = {silent = true, noremap = true}

remap("n", "<leader>xx", "<cmd>Trouble<cr>", opt);
remap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opt);
remap("n", "<leader>xb", "<cmd>Trouble lsp_document_diagnostics<cr>", opt);
remap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opt);
remap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opt);
remap("n", "gR", "<cmd>Trouble lsp_references<cr>", opt);
