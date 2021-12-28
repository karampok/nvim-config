local M = {}

function M.magic_line_numbers_enter()
    -- TODO: Find a way after win resize to check win size
    -- local winnr = vim.api.nvim_get_current_win()
    -- if vim.fn.winwidth(winnr) > 85 then
    -- end
    vim.wo.numberwidth = 3
    vim.wo.number = true
    vim.wo.relativenumber = true
end

function M.magic_line_numbers_leave()
    vim.wo.number = false
    vim.wo.relativenumber = false
end

-- Functions from
-- https://github.com/ibhagwan/nvim-lua/blob/main/lua/utils.lua

function M.shell_type(file)
  vim.fn.system(string.format("type '%s'", file))
  if vim.v.shell_error ~= 0 then
      return false
  else
      return true
  end
end

-- function M.toggle_colorcolumn()
  -- local wininfo = vim.fn.getwininfo()
  -- for _, win in pairs(wininfo) do
    -- local ft = vim.api.nvim_buf_get_option(win['bufnr'], 'filetype')
    -- -- print(win['winnr'], win['width'], ft)
    -- if ft == nil or ft == '' or ft == 'TelescopePrompt' then return end
    -- if not vim.g.colorcolumn then vim.g.colorcolumn = 81 end
    -- if win['width'] < vim.g.colorcolumn then
      -- vim.api.nvim_win_set_option(win['winid'], 'colorcolumn', '')
    -- else
      -- vim.api.nvim_win_set_option(win['winid'], 'colorcolumn', string.format(vim.g.colorcolumn))
    -- end
  -- end
-- end

function M.tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- QUICKFIX LISTS

-- open quickfix if not empty
function M.open_qf()
  local qf_name = 'quickfix'
  local qf_empty = function() return vim.tbl_isempty(vim.fn.getqflist()) end
  if not qf_empty() then
    vim.cmd('copen')
    vim.cmd('wincmd J')
  else
    print(string.format("%s is empty.", qf_name))
  end
end

-- 'q': find the quickfix window
-- 'l': find all loclist windows
function M.find_qf(type)
  local wininfo = vim.fn.getwininfo()
  local win_tbl = {}
  for _, win in pairs(wininfo) do
      local found = false
      if type == 'l' and win['loclist'] == 1 then
        found = true
      end
      -- loclist window has 'quickfix' set, eliminate those
      if type == 'q' and win['quickfix'] == 1 and win['loclist'] == 0  then
        found = true
      end
      if found then
        table.insert(win_tbl, { winid = win['winid'], bufnr = win['bufnr'] })
      end
  end
  return win_tbl
end

-- toggle quickfix/loclist on/off
-- type='*': qf toggle and send to bottom
-- type='l': loclist toggle (all windows)
function M.toggle_qf(type)
  local windows = M.find_qf(type)
  if M.tablelength(windows) > 0 then
    -- hide all visible windows
    for _, win in pairs(windows) do
      vim.api.nvim_win_hide(win.winid)
    end
  else
    -- no windows are visible, attempt to open
    if type == 'l' then
      M.open_loclist_all()
    else
      M.open_qf()
    end
  end
end

-- enum all non-qf windows and open
-- loclist on all windows where not empty
function M.open_loclist_all()
  local wininfo = vim.fn.getwininfo()
  local qf_name = 'loclist'
  local qf_empty = function(winnr) return vim.tbl_isempty(vim.fn.getloclist(winnr)) end
  for _, win in pairs(wininfo) do
      if win['quickfix'] == 0 then
        if not qf_empty(win['winnr']) then
          -- switch active window before ':lopen'
          vim.api.nvim_set_current_win(win['winid'])
          vim.cmd('lopen')
        else
          print(string.format("%s is empty.", qf_name))
        end
      end
  end
end

function M.get_visual_selection()
    -- must exit visual mode or program croaks
    -- :visual leaves ex-mode back to normal mode
    -- use 'gv' to reselect the text
    vim.cmd[[visual]]
    local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
    local lines = vim.fn.getline(csrow, cerow)
    -- local n = cerow-csrow+1
    local n = M.tablelength(lines)
    if n <= 0 then return '' end
    lines[n] = string.sub(lines[n], 1, cecol)
    lines[1] = string.sub(lines[1], cscol)
    print(n, csrow, cscol, cerow, cecol, table.concat(lines, "\n"))
    return table.concat(lines, "\n")
end

function M.ensure_loaded_fns(modules, fn)
  vim.cmd[[packadd packer.nvim]]
  for _, m in ipairs(modules) do
    vim.cmd([[PackerLoad ]] .. m)
  end
  fn()
end

function M.git_commit_message_iab()
    local exec = vim.fn.system
    local git_user = exec('git config --get user.name'):gsub('\n', '')
    local git_email = exec('git config --get user.email'):gsub('\n', '')

    local signature = string.format('%s <%s>', git_user, git_email)

    vim.cmd('iab #S Signed-off-by: ' .. signature)
    vim.cmd('iab #R Reviewed-by: ' .. signature)
    vim.cmd('iab #O Signed-off-by:')
    vim.cmd('iab #V Reviewed-by:')
    vim.cmd('iab #P Pair-Programmed-With:')
    vim.cmd('iab ME ' .. signature)
    vim.cmd('iab AB Alexander<SPACE>Bokovoy<SPACE><ab@samba.org>')
    vim.cmd('iab ABARTLET Andrew<SPACE>Bartlet<SPACE><abartlet@samba.org>')
    vim.cmd('iab ARIS Aris<SPACE>Adamantiadis<SPACE><aris@0xbadc0de.be>')
    vim.cmd('iab ASN Andreas<SPACE>Schneider<SPACE><asn@samba.org>')
    vim.cmd('iab GD Guenther<SPACE>Deschner<SPACE><gd@samba.org>')
    vim.cmd('iab GLOCKYER Gary<SPACE>Lockyer<SPACE><gary@samba.org>')
    vim.cmd('iab JJELEN Jakub<SPACE>Jelen<SPACE><jjelen@redhat.com>')
    vim.cmd('iab JRA Jeremy<SPACE>Allison<SPACE><jra@samba.org>')
    vim.cmd('iab JSTEPHEN Justin<SPACE>Stephenson<SPACE><jstephen@redhat.com>')
    vim.cmd('iab METZE Stefan<SPACE>Metzmacher<SPACE><metze@samba.org>')
    vim.cmd('iab OBNOX Michael<SPACE>Adam<SPACE><obnox@samba.org>')
    vim.cmd('iab PFILIPEN Pavel<SPACE>Filipenský<SPACE><pfilipen@redhat.com>')
    vim.cmd('iab RH_ASN Andreas<SPACE>Schneider<SPACE><asn@redhat.com>')
    vim.cmd('iab SLOW Ralph<SPACE>Boehme<SPACE><slow@samba.org>')
    vim.cmd('iab URI Uri<SPACE>Simchoni<SPACE><uri@samba.org>')
    vim.cmd('iab VL Volker<SPACE>Lendecke<SPACE><vl@samba.org>')
end

return M
