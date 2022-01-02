if not pcall(require, "telescope") then
  return
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            "/usr/bin/rg",
            "--hidden",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            [[--glob=!.git/*]],
            [[--glob=!node_modules/*]],
        },
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        color_devicons = true,

        file_sorter = sorters.get_fzy_sorter,

        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        set_env = { ['COLORTERM'] = 'truecolor' },

        layout_strategy = "flex",
        layout_config = {
            width = 0.95,
            height = 0.85,
            prompt_position = "bottom",
            scroll_speed = 1, -- scroll by 1 line in previewer

            horizontal = {
                width = 0.9,
                preview_cutoff = 60,
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.7)
                    else
                        return math.floor(cols * 0.6)
                    end
                end,
            },
            vertical = {
                width = 0.75,
                height = 0.85,
                preview_height = 0.4,
                mirror = true,
            },
            flex = {
                -- change to horizontal after 120 cols
                flip_columns = 120,
            },
        },

        mappings = {
            i = {
                ["<C-x>"] = actions.delete_buffer,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<S-up>"] = actions.preview_scrolling_up,
                ["<S-down>"] = actions.preview_scrolling_down,
                ["<C-up>"] = actions.preview_scrolling_up,
                ["<C-down>"] = actions.preview_scrolling_down,

                -- TODO: look into using 'actions.set.shift_selection'
                ["<C-u>"] = actions.move_to_top,
                ["<C-d>"] = actions.move_to_middle,
                ["<C-b>"] = actions.move_to_top,
                ["<C-f>"] = actions.move_to_bottom,

                ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-y>"] = set_prompt_to_entry_value,

                ["<C-c>"] = actions.close,
            },
            n = {
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.delete_buffer,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["<S-up>"] = actions.preview_scrolling_up,
                ["<S-down>"] = actions.preview_scrolling_down,
                ["<C-up>"] = actions.preview_scrolling_up,
                ["<C-down>"] = actions.preview_scrolling_down,

                ["<C-u>"] = actions.move_to_top,
                ["<C-d>"] = actions.move_to_middle,
                ["<C-b>"] = actions.move_to_top,
                ["<C-f>"] = actions.move_to_bottom,

                ["<C-q>"] = actions.send_to_qflist,
                ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,

                ["<C-c>"] = actions.close,
                ["<Esc>"] = false,
            },
        },
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
}
require('telescope').load_extension('fzy_native')

require('plugins.telescope.mappings')
