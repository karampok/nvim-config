return {
 "nvim-orgmode/orgmode",
 dependencies = { "nvim-treesitter/nvim-treesitter" },
 config = function()
   require('orgmode').setup_ts_grammar()
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
-- win_split_mode =  {'float', 0.9},
      org_capture_templates = {
         c = {
          description = 'code',
          template = '* %a %? \n',
          target = '/home/kka/myspace/org/code.org'
         },
         n = {
          description = 'note',
          template = '* %? \n',
          headline = 'Notes',
          target = '/home/kka/myspace/org/notes.org'
          },
         j = {
          description = 'journal',
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
