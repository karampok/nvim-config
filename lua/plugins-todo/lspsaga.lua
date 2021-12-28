local saga = require('lspsaga')

saga.init_lsp_saga({
    use_saga_diagnostic_sign = false,
    code_action_icon = ' ',
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
    },
    finder_action_keys = {
        open = 'o',
        vsplit = 'v',
        split = 's',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>'
    },
    border_style = "single"
})
