return {
 "nvim-orgmode/orgmode",
 lazy=false,
 dependencies = { "nvim-treesitter/nvim-treesitter" },
 ft = {'org'},
 config = function()
   require('orgmode').setup_ts_grammar()
   require('orgmode').setup({
      org_agenda_files = {'~/myspace/org/**/*'},

      org_default_notes_file = '~/myspace/org/refile.org',
      org_capture_templates = {
         j = {
          description = 'Journal',
          template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
          target = '~/myspace/org/journal.org'
        },
        e =  'Event',
        er = {
          description = 'recurring',
          template = '** %?\n %T',
          target = '~/myspace/org/er.org',
          headline = 'recurring'
        },
        eo = {
          description = 'one-time',
          template = '** %?\n %T',
          target = '~/myspace/org/calendar.org',
          headline = 'one-time'
        },
        r = {
            description = "Repo",
            template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
            target = "~/myspace/org/repos.org",
        }
      }
   })
 end,
}
