local M = {
    'folke/which-key.nvim',
    lazy = false,
    version = '*', -- use stable branch
}

function M.config()
    local wk = require('which-key')

    local conf ={
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20 -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true -- bindings for prefixed with g
            }
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = {
            gc = "Comment/Uncomment linewise",
            gb = "Comment/Uncomment blockwise",
        },
        hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = {"<leader>"} -- or specifiy a list manually
    }

    local opts = {
        mode = "n", -- NORMAL mode
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        nowait = false -- use `nowait` when creating keymaps
    }

    local keymaps = {
        ["w"] = { "<cmd>update!<CR>", "Save" },
    }

    wk.setup(conf)
    wk.register(keymaps, opts)
end

return M
