return {
 "nvim-orgmode/orgmode",
 dependencies = { "nvim-treesitter/nvim-treesitter" },
 config = function()
   require('orgmode').setup_ts_grammar()
   require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
      },
      ensure_installed = { 'org' },
    })
   require('orgmode').setup({
      org_agenda_files = {'/home/kka/myspace/org/**/*'},
      org_default_notes_file = '/home/kka/myspace/org/refile.org',
-- win_split_mode =  {'float', 0.9},
      org_capture_templates = {
         n = {
          description = 'Notes',
          template = '* %? \n',
          headline = 'Notes',
          target = '/home/kka/myspace/org/notes.org'
          },
 
         j = {
          description = 'Journal',
          template = '* %? %T\n',
          target = '/home/kka/myspace/org/wlog.org'
          },
          e =  'Event',
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
