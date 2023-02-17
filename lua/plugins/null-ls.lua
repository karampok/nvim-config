local vim = vim
local M = {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    lazy = true,
}

function M.config()
    local null_ls = require('null-ls')

    -- register any number of sources simultaneously
    local sources = {}

    if vim.fn.executable('shfmt') == 1 then
        local cwd = vim.fn.getcwd()

        if string.find(cwd, 'samba', 1, true) then
            table.insert(
                sources,
                null_ls.builtins.formatting.shfmt.with({
                    extra_args = { '-p', '-i', '0', '-fn' },
                })
            )
        else
            table.insert(
                sources,
                null_ls.builtins.formatting.shfmt.with({
                    extra_args = { '-i', '4', '-fn' },
                })
            )
        end
    end

    if vim.fn.executable('stylua') == 1 then
        table.insert(sources, null_ls.builtins.formatting.stylua)
    end

    if vim.fn.executable('yamllint') == 1 then
        table.insert(sources, null_ls.builtins.diagnostics.yamllint)
    end

    null_ls.setup({
        debug = false,
        sources = sources,
    })
end

return M
