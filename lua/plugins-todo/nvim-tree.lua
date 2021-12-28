vim.g.nvim_tree_width = 50 -- default window width
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '.clangd' }
vim.g.nvim_tree_gitignore = 1 -- use .gitignore
vim.g.nvim_tree_auto_close = 1 -- closes the tree when it's the last window
vim.g.nvim_tree_add_trailing = 1 -- append a trailing slash to folder names
vim.g.nvim_tree_auto_open = 0 -- opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}
