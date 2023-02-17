-- init.lua
--
require('orgmode').setup({
  org_agenda_files = { '~/myspace/rh-vimwiki/**/*.org' },
  org_default_notes_file = '~/myspace/rh-vimwiki/refile.org',
  org_agenda_min_height = 32,
  org_capture_templates = {
    t = {
      description = 'Task',
      template = '* TODO %?\n  %u',
    },
    j = {
      description = 'Journal',
      template = '* %?\n  %t',
      target = '~/myspace/rh-vimwiki/journal.org'
    },
    e = 'Event',
    er = {
      description = 'recurring',
      template = '** %?\n %T',
      target = '~/myspace/rh-vimwiki/calendar.org',
      headline = 'recurring'
    },
    eo = {
      description = 'one-time',
      template = '** %?\n %T',
      target = '~/myspace/rh-vimwiki/calendar.org',
      headline = 'one-time'
    }
  },
  mappings = {
    agenda = {},
  },
})
