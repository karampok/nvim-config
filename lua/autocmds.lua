local vim = vim
local api = vim.api

local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup ' .. group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

local autocmds = {
  open_folds = {
    { "BufReadPost,FileReadPost", "*", "normal zR" }
  },
  help = { -- For help files, make <Return> behave like <C-]> (jump to tag)
    { "FileType", "help", "nmap <buffer> <Return> <C-]>" };
  };

  spelling = {
    { "FileType", "gitcommit,asciidoc,markdown", [[lua vim.wo.spell=true]] };
    { "BufEnter,BufRead", "WHATSNEW.txt", [[lua vim.wo.spell=true]] };
  };

  git = {
--    { "FileType", "gitcommit", [[lua require('utils').git_commit_message_iab() ]] };
  };

  format = {
  --  { "BufWritePre", "*.go", [[lua vim.lsp.buf.formatting_sync(nil,500)]] };
    --       { "BufWritePre", "*.go", [[lua org_imports(3000)]] };
  };

  -- diaryIndex = {
  --     { "BufRead,BufNewFile", "*.diary.wiki", [[ VimwikiDiaryGenerateLinks ]]  };
  -- };

}

nvim_create_augroups(autocmds)

vim.cmd [[
" Add format option 'w' to add trailing white space, indicating that paragraph
" continues on next line. This is to be used with mutt's 'text_flowed' option.
" https://brianbuccola.com/line-breaks-in-mutt-and-vim/
" https://incenp.org/notes/2020/format-flowed-neomutt-vim.html
au BufNewFile,BufRead neomutt-* setf mail
autocmd Filetype mail call SetMailOptions()
function SetMailOptions()
    setl tw=72
    setl fo+=watqc
    setl nojs
    setl nosmartindent
    setl foldexpr=strlen(substitute(matchstr(getline(v:lnum),'\\v^\\s*%(\\>\\s*)+'),'\\s','','g'))
    setl foldmethod=expr foldlevel=1 foldminlines=2
endfunction
]]
