return {
 "ahmedkhalf/project.nvim",
 event = 'VeryLazy',
 config = function()
   require("project_nvim").setup ({
      silent_chdir = false,
      patterns = {">.config"},
   })
 end,
}
