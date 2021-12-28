local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local remap_buf = vim.api.nvim_buf_set_keymap

local lsp_on_attach = function(client, bufnr)
    if pcall(require, "cmp") and
       pcall(require, "cmp_nvim_lsp") and
       pcall(require, "luasnip") then


        require('cmp_nvim_lsp').setup()

        local cmp = require('cmp')
        local ls = require('luasnip')

        cmp.setup({
            completion = {
                keyword_length = 2,
            },


            sources = {
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'buffer' },
            },


            mapping = {
                ['<Tab>'] = function(fallback)
                    if vim.fn.pumvisible() == 1 then
                        vim.fn.feedkeys(t('<C-n>'), 'n')
                    elseif check_back_space() then
                        vim.fn.feedkeys(t('<Tab>'), 'n')
                    elseif ls.expand_or_jumpable() then
                        vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
                    else
                        fallback()
                    end
                end,
                ['<S-Tab>'] = function(fallback)
                    if vim.fn.pumvisible() == 1 then
                        vim.fn.feedkeys(t('<C-p>'), 'n')
                    elseif ls.jumpable(-1) then
                        vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
                    else
                        fallback()
                    end
                end,
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }
        })
    end

    require('lsp_signature').on_attach({
        bind = true,
        floating_window = false,
        hint_enable = true,
        hint_prefix = ' ',
        hint_scheme = 'String',
        handler_opts = {
            border = 'single',
        },
    })

    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
        client.config.flags.debounce_text_changes  = 100
    end

    local opts = { noremap=true, silent=true }

    remap_buf(bufnr, 'i', '<Tab>', '(pumvisible() ? "\\<C-n>" : "\\<Tab>")', {expr = true})
    remap_buf(bufnr, 's', '<Tab>', '(pumvisible() ? "\\<C-n>" : "\\<Tab>")', {expr = true})

    remap_buf(bufnr, 'i', '<a-j>', [[<Plug>(completion_next_source)]], {})
    remap_buf(bufnr, 's', '<a-j>', [[<Plug>(completion_next_source)]], {})

    -- Make up/down arrows behave in completion popups
    -- without this they move up/down but v:completed_item remains empty
    remap_buf(bufnr, 'i', '<down>', '(pumvisible() ? "\\<C-n>" : "\\<down>")', { noremap = true, expr = true })
    remap_buf(bufnr, 'i', '<up>',   '(pumvisible() ? "\\<C-p>" : "\\<up>")',   { noremap = true, expr = true })

    remap_buf(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    remap_buf(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    remap_buf(bufnr, 'n', '<c-k>',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    remap_buf(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    remap_buf(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    remap_buf(bufnr, 'v', 'ga', ':<C-U>lua vim.lsp.buf.range_code_action()<CR>', opts)
    remap_buf(bufnr, 'n', 'gm', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    remap_buf(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    remap_buf(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>K',  '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>k', '<cmd>lua require("lsp").peek_definition()<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    remap_buf(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    remap_buf(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    remap_buf(bufnr, 'n', '[D', '<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>', opts)
    remap_buf(bufnr, 'n', ']D', '<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>lc', '<cmd>lua vim.lsp.diagnostic.clear(0)<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>lQ', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>lt', "<cmd>lua require'lsp'.virtual_text_toggle()<CR>", opts)

    remap_buf(bufnr, 'n', 'gh', [[<cmd>lua require('lspsaga.provider').lsp_finder()<CR>]], opts)
    remap_buf(bufnr, 'n', 'ca', [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], opts)

    remap_buf(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    remap_buf(bufnr, 'n', '<leader>lS', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)


    if client.resolved_capabilities.document_formatting then
        remap_buf(bufnr, 'n', 'gq', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        remap_buf(bufnr, 'v', 'gq', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    if client.resolved_capabilities.code_lens then
        remap_buf(bufnr, "n", "<leader>lL", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
        vim.api.nvim_command [[autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
    end

    -- Per buffer LSP indicators control
    if vim.b.lsp_virtual_text_enabled == nil then
        vim.b.lsp_virtual_text_enabled = true
    end

    if vim.b.lsp_virtual_text_mode == nil then
        vim.b.lsp_virtual_text_mode = 'SignsVirtualText'
    end

end

-----------------------------------------------------------
-- LSP SERVER SETUP
-----------------------------------------------------------

local lsp_servers = {}
local lsp_config = require('lspconfig')
local lsp_servers = {"pyright", "bashls", "gopls"}
local shellcheck = require('lsp.diagnosticls.linters.shellcheck')
local yamllint = require('lsp.diagnosticls.linters.yamllint')
local shfmt = require('lsp.diagnosticls.formatters.shfmt')
lsp_config.diagnosticls.setup {
    on_attach = lsp_on_attach,
    filetypes = { 'sh', 'yaml' },
    init_options = {
        filetypes = {
            sh = 'shellcheck',
            yaml = 'yamllint',
        },
        linters = {
            shellcheck = shellcheck,
            yamllint = yamllint,
        },

        formatFiletypes = {
            sh = 'shfmt',
        },
        formatters = {
            shfmt = shfmt,
        },
    },
}

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require, "cmp") and
   pcall(require, 'cmp_nvim_lsp') then
    lsp_capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_capabilities)
end

for _, lsp in ipairs(lsp_servers) do
    lsp_config[lsp].setup {
        on_attach = lsp_on_attach,
        capabilities = lsp_capabilities,
    }
end
