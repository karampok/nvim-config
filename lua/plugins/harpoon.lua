return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('harpoon').setup()
      local harpoon = require('harpoon')
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc ="Add to harpoon"})
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
      end

    vim.keymap.set("n", "<leader>b>", function() toggle_telescope(harpoon:list()) end,
--    vim.keymap.set('n', '<leader>b', ':ToggleBlame virtual<CR>')
      { desc = "Open harpoon window" })
     end,
}
