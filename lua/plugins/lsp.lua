local vim=vim
return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/vim-vsnip',
  },

  config = function()
    local cmp = require('cmp')
    cmp.setup({
      completion = {
        autocomplete = false,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete({
          reason = cmp.ContextReason.Auto,
        }), {'i', 'c'}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ['<Tab>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      }),
      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      }),
    })

    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = { 'bashls', 'dockerls', 'golangci_lint_ls', 'gopls', 'lua_ls', 'yamlls'}
    })

    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(_, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        local opts1 = { buffer = bufnr, noremap = true, silent = true, desc = desc }
        vim.keymap.set('n', keys, func, opts1)
      end

      local opts = { buffer = bufnr, noremap = true, silent = true, desc = "old" }
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      nmap('go', vim.lsp.buf.type_definition, 'Type [D]efinition')
      nmap('gn', vim.lsp.buf.rename, '[G]o [R]ename')
      nmap('ga', vim.lsp.buf.code_action, '[G]o code [A]ction')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      vim.keymap.set('x', 'ga', function() vim.lsp.buf.range_code_action() end, opts)
      vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    end

    local lspconfig = require('lspconfig')
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        -- settings for all servers
        local server_setup = {
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        }

        -- server-specific setup
        if server_name == 'lua_ls' then
          server_setup.settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
              telemetry = { enable = false },
            },
          }
        end

        lspconfig[server_name].setup(server_setup)
      end
    })

    local shellcheck = require('diagnosticls.linters.shellcheck')
    local yamllint = require('diagnosticls.linters.yamllint')
    lspconfig.diagnosticls.setup {
        filetypes = { 'sh', 'yaml' },
        init_options = {
          filetypes = {
            yaml = 'yamllint',
          },
          linters = {
            shellcheck = shellcheck,
            yamllint = yamllint,
          },
        },
      }


  end,
}
