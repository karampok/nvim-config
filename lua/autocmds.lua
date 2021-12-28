local vim = vim
local api = vim.api

-- Taken from https://github.com/norcalli/nvim_utils
local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

local autocmds = {
    help = { -- For help files, make <Return> behave like <C-]> (jump to tag)
        { "FileType", "help", "nmap <buffer> <Return> <C-]>" };
    };

    spelling = {
        { "FileType", "gitcommit,asciidoc,markdown", [[lua vim.wo.spell=true]] };
        { "BufEnter,BufRead", "WHATSNEW.txt", [[lua vim.wo.spell=true]] };
    };

    git = {
        { "FileType", "gitcommit", [[lua require('utils').git_commit_message_iab() ]] };
    };

    format = {
        { "BufWritePre", "*.go", [[lua vim.lsp.buf.formatting_sync(nil,500)]] };
        { "BufWritePre", "*.go", [[lua org_imports(3000)]] };
    };

    -- diaryIndex = {
    --     { "BufRead,BufNewFile", "*.diary.wiki", [[ VimwikiDiaryGenerateLinks ]]  };
    -- };

}

function org_imports(wait_ms)
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit)
          else
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
 end

-- Highlight long lines
--long_lines = {
--    { "BufWinEnter", "*.c,*.h", "let w:m2=matchadd('ErrorMsg', '%>80v.+', -1)" };
--};

nvim_create_augroups(autocmds)
