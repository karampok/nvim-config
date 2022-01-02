local themes = require('telescope.themes')

local M = {}

function M.fd()
  require('telescope.builtin').fd()
end

function M.builtin()
  require('telescope.builtin').builtin()
end

function M.lsp_code_actions()
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        path_display = { "absolute" },
    }

    require("telescope.builtin").lsp_code_actions(opts)
end

function M.grep_prompt()
    require("telescope.builtin").grep_string {
        path_display = { "absolute" },
        search = vim.fn.input "Grep String ❯ ",
    }
end

function M.grep_visual()
    require("telescope.builtin").grep_string {
        path_display = { "absolute" },
        search = require('utils').get_visual_selection()
    }
end

function M.grep_cWORD()
    require("telescope.builtin").grep_string {
        path_display = { "absolute" },
        search = vim.fn.expand("<cWORD>"),
    }
end

function M.grep_last_search(opts)
    opts = opts or {}

    -- \<getreg\>\C
    -- -> Subs out the search things
    local register = vim.fn.getreg("/"):gsub("\\<", ""):gsub("\\>", ""):gsub("\\C", "")

    opts.path_display = { "absolute" }
    opts.word_match = "-w"
    opts.search = register

    require("telescope.builtin").grep_string(opts)
end

function M.installed_plugins()
    require("telescope.builtin").find_files {
        cwd = vim.fn.stdpath "data" .. "/site/pack/packer/",
    }
end

function M.project_search()
    require("telescope.builtin").find_files {
        previewer = false,
        layout_strategy = "vertical",
        cwd = require("nvim_lsp.util").root_pattern ".git"(vim.fn.expand "%:p"),
    }
end

function M.curbuf()
    local opts = themes.get_dropdown {
        winblend = 10,
        border = true,
        previewer = false,
        path_display = { "absolute" },
    }
    require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

function M.help_tags()
    require("telescope.builtin").help_tags {
        show_version = true,
    }
end

function M.find_files()
    require("telescope.builtin").fd {
        -- find_command = { "fd", "--hidden", "--follow", "--type f" },
        file_ignore_patterns = {"node_modules", ".pyc"},
    }
end

function M.search_all_files()
    require("telescope.builtin").find_files {
        find_command = { "rg", "--no-ignore", "--files" },
    }
end

function M.git_commits()
    require("telescope.builtin").git_commits {
        winblend = 5,
    }
end

function M.ensure_loaded_fns(modules, fn)
  vim.cmd[[packadd packer.nvim]]
  for _, m in ipairs(modules) do
    vim.cmd([[PackerLoad ]] .. m)
  end
  fn()
end

return setmetatable({}, {
  __index = function(_, k)

    if M[k] then
      return M[k]
    else
      return require("telescope.builtin")[k]
    end
  end,
})
