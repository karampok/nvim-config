return {
 "nvim-orgmode/orgmode",
 dependencies = { "nvim-treesitter/nvim-treesitter",  "lukas-reineke/headlines.nvim",'akinsho/org-bullets.nvim'},
 config = function()
   require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    })
   require('orgmode').setup({
      org_agenda_files = {'/home/kka/myspace/org/**/*'},
      org_default_notes_file = '/home/kka/myspace/org/refile.org',
      org_blank_before_new_entry = { heading = false, plain_list_item = false },
--      win_split_mode =  {'float', 0.9},
      mappings = { 
        org = {
          org_toggle_checkbox = 'cc',
        },
        org_return_uses_meta_return = true,
      },
      org_capture_templates = {
         c = {
          description = 'code',
          template = '* %a \n%?',
          target = '/home/kka/myspace/org/code.org'
         },
         n = {
          description = 'note',
          template = '* %? \n',
          headline = 'Notes',
          target = '/home/kka/myspace/org/notes.org'
          },
         l = {
          description = 'log entry',
            template = '* %? %t',
            target = '~/myspace/org/wlog.org',
            datetree = { reversed = True , tree_type = 'week' },
          },
          e =  'event',
          er = {
            description = 'recurring',
            template = '* %? %T\n',
            target = '/home/kka/myspace/org/events.org',
            headline = 'recurring'
          },
          eo = {
            description = 'one-time',
            template = '* %? %T\n',
            target = '/home/kka/myspace/org/events.org',
            headline = 'one-time',
          },
      }
   })
 end,
}
