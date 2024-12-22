-- global function to use with lua
-- can be used without importing this modul
P = function(v)
  -- inspect the parameter
  print(vim.inspect(v))
  return v
end

local M = {}
M.get_scratch = function()
  -- create a scratch buffer in a new tab
  -- this will be a buffer that cannot be saved
  -- used only fro drafts

  vim.api.nvim_command('tabnew')
  vim.api.nvim_create_buf(false, true)
  vim.opt_local.buftype = 'nofile'
  vim.opt_local.bufhidden = 'hide'
  -- do not create a swap file
  vim.opt_local.swapfile = false
end

M.circle = function(char)
  -- circle the current word with the string passed

  local prefix = char or '"'
  local suffix = prefix
  if prefix == '"' or prefix == "'" then
    -- like pass in python
  elseif prefix == '(' or prefix == ')' then
    prefix = '('
    suffix = ')'
  elseif prefix == '<' or prefix == '>' then
    prefix = '<'
    suffix = '>'
  end

  -- expand('<cword>') to get the current word under cursor
  local current_word = vim.call('expand', '<cword>')
  -- change case
  local circled_word = prefix .. current_word .. suffix
  vim.cmd("normal! ciw" .. circled_word)
end

-- the return table is used to permit the retrive of the functions with
-- :lua require("klaudjan.utils").function_name()
return M
