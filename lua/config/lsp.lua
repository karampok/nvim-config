local settings = {
  mappings = {
    gd = 'lua require"telescope.builtin".lsp_definitions()',
    gi = 'lua require"telescope.builtin".lsp_implementations()',
    gr = 'lua require"telescope.builtin".lsp_references()',
  },
  servers = {
    pylsp = {},
    zk = {},
    jsonls = {},
    bashls = {},
    dockerls = {},
    gopls = {
      settings = {
        golsp = {
          gofumpt = true,
          staticcheck = true,
          useplaceholders = true,
          codelenses = {
            gc_details = true,
          },
        },
      },
    },
    clangd = {},
    sumneko_lua = require('neodev').setup(),
    ['rust_analyzer@nightly'] = {
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
        },
      },
    }
  },
}

require('lsp-setup').setup(settings)
require('lsp_lines').setup()

-- global config for diagnostic
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
})

require('lsp_signature').setup()
require('lsp-colors').setup()

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

local lsp_config = require('lspconfig')
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
