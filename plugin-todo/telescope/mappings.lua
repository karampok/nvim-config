if not pcall(require, "telescope") then
  return
end

TelescopeMapArgs = TelescopeMapArgs or {}

local remap_tele = function(mode, key, f, options, buffer)
    local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

    TelescopeMapArgs[map_key] = options or {}

    local rhs = string.format([[<cmd>lua require('plugins.telescope.handlers').ensure_loaded_fns(]] ..
        [[ {'plenary.nvim', 'popup.nvim', 'telescope-fzy-native.nvim', 'telescope.nvim' }, function()]] ..
        [[ require('plugins.telescope.handlers')['%s'](TelescopeMapArgs['%s'])]] ..
        [[ end)<CR>]],
        f, map_key)

    local map_options = {
        noremap = true,
        silent = true,
    }

    if not buffer then
        vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    else
        vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
    end
end

remap_tele('n', '<F1>', "help_tags")
remap_tele('n', '<c-p>', "find_files")
remap_tele('n', '<leader>;', "buffers")
remap_tele('n', '<leader>fM', "man_pages")
remap_tele('n', '<leader>fQ', "loclist")
remap_tele('n', '<leader>fR', "registers")
remap_tele('n', '<leader>fT', "tags")
remap_tele('n', '<leader>fb', "current_buffer_fuzzy_find")
remap_tele('n', '<leader>fc', "commands")
remap_tele('n', '<leader>ff', "grep_prompt")
remap_tele('n', '<leader>fg', "git_files")
remap_tele('n', '<leader>fh', "oldfiles")
remap_tele('n', '<leader>fk', "keymaps")
remap_tele('n', '<leader>fl', "live_grep", { debounce = 600 })
remap_tele('n', '<leader>fm', "marks")
remap_tele('n', '<leader>fo', "vim_options")
remap_tele('n', '<leader>fq', "quickfix")
remap_tele('n', '<leader>fs', "grep_string")
remap_tele('n', '<leader>ft', "current_buffer_tags")
remap_tele('n', '<leader>fx', "command_history")
remap_tele('n', '<leader>fz', "spell_suggest")

remap_tele('n', '<leader>fW', "grep_cWORD")
remap_tele('n', '<leader>fr', "grep_prompt")
remap_tele('n', '<leader>fv', "grep_visual")
remap_tele('v', '<leader>fv', "grep_visual")
remap_tele('n', "<leader>f/", "grep_last_search", {
  layout_strategy = "vertical",
})

remap_tele('n', '<leader>fB', "git_branches")
remap_tele('n', '<leader>gC', "git_commits")

remap_tele('n', '<leader>lr', "lsp_references")
remap_tele('n', '<leader>la', "lsp_code_actions")
remap_tele('n', '<leader>lA', "lsp_range_code_actions")
remap_tele('n', '<leader>ld', "lsp_definitions")
remap_tele('n', '<leader>lm', "lsp_implementations")
remap_tele('n', '<leader>lg', "lsp_document_diagnostics")
remap_tele('n', '<leader>lG', "lsp_workspace_diagnostics")
remap_tele('n', '<leader>ls', "lsp_document_symbols")
remap_tele('n', '<leader>lS', "lsp_workspace_symbols")

-- Telescope Meta
remap_tele('n', "<leader>f?", "builtin")

return remap_tele
