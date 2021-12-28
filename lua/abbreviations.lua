-- Yruler: A "ruler" - nice for counting the length of words.
-- 80 digits there - just perfect for a standard terminal!
vim.cmd('iab Yruler  1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890')

vim.cmd('iab YDate <C-R>=strftime("%Y-%m-%d")<CR>')          -- Example: 2002-04-06
vim.cmd('iab YDATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>') -- Example: Tue Dec 16 12:07:00 CET 1997
vim.cmd('iab Ytime <C-R>=strftime("%H:%M")<CR>')             -- Example: 14:28
vim.cmd('iab YSpecDate * <C-R>=strftime("%a %b %d %Y")<CR> Andreas Schneider <asn@redhat.com> -')

vim.cmd('iab YDebug DBG_ERR("\\n")')
