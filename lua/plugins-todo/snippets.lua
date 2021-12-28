local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local remap = vim.api.nvim_set_keymap

local ls = require('luasnip')

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
}

require("luasnip/loaders/from_vscode").lazy_load()


local opts = {silent = true, expr = true}

remap('i', '<C-j>', t("luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-j>'"), opts)
remap('s', '<C-j>', t("luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-j>'"), opts)

remap('i', '<C-k>', t("luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-k>'"), opts)
remap('s', '<C-k>', t("luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-k>'"), opts)
