local vim = vim
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_list = {{
      ['path'] = '~/myspace/rh-vimwiki',
      syntax = 'markdown',
      ext = '.wiki.md',
      diary_frequency = 'weekly',
      diary_start_week_monday = 1,
}}

vim.g.vimwiki_ext2syntax = {
  ['.md'] = 'markdown',
  ['.markdown'] = 'markdown',
  ['.mdown'] = 'markdown',
}
vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki (0)
vim.g.vimwiki_folding = "list"
vim.g.vimwiki_hl_headers = 1  -- use alternating colours for different heading levels
vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links
vim.g.indentLine_conceallevel = 2 -- indentline controlls concel
--vim.set.o.conceallevel = 1 -- so that I can see `` and full urls in markdown files

vim.api.nvim_set_keymap("n", "<F3>", ":VimwikiDiaryPrevDay<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<F4>", ":VimwikiDiaryNextDay<CR>", { noremap = true, silent = true, nowait = true })

vim.cmd [[
  autocmd FileType vimwiki nmap <leader><space> <Plug>VimwikiToggleListItem
]]

--vim.cmd [[
--autocmd BufNewFile */diary/????-??-??.md call New_vimwiki_diary_template()
--autocmd BufNewFile */diary/????-??-??.md call New_vimwiki_diary_template()
--function New_vimwiki_diary_template()
--"" If it's Friday, open a end of week lookback template
--   if system('date +%u') == 5
--        read ~/vimwiki/Diary\ TemplateEndOfWeek.md | execute "normal ggdd"
--    else
--        read  ~/vimwiki/Diary\ Template.md | execute "normal ggdd"
--    end
-- endfunction
--]]
return {
    'vimwiki/vimwiki',
    branch = 'dev',
    lazy=false,
}
