-- global function to use with lua
-- can be used without importing this modul
P = function(v)
  -- inspect the parameter
  print(vim.inspect(v))
  return v
end

local M = {}
--- Open a floating window
--- @param buffer integer Buffer to display, or 0 for current buffer
--- @param opts table Optional parameters
--- • col number (optional) x position of the window
--- • row number (optional) y position of the window
--- • width number (optional) width of the window
--- • height number (optional) height of the window
--- @return win number created window
M.open_floating_window = function(buffer, opts)
  -- Get the current buffer size
  local width = vim.api.nvim_get_option_value('columns', {})
  local height = vim.api.nvim_get_option_value('lines', {})

  local default_row = math.floor(height * 0.4)  -- Window appears near the middle of the screen
  local default_col = math.floor(width * 0.25)  -- Window is centered horizontally
  local default_width = math.floor(width * 0.5) -- Window width is 50% of the editor's width
  local default_height = 3
  local opts = opts or {}

  -- Define the floating window's size and position
  local float_opts = {
    relative = 'editor', -- The floating window is relative to the editor
    width = opts.width or default_width,
    height = opts.height or default_height,
    row = opts.row or default_row,
    col = opts.col or default_col,
    style = 'minimal',  -- Minimal window style with no borders or other decorations
    border = 'rounded', -- Optional: Adds rounded borders
  }

  -- Open the floating window
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, { opts.message }) -- Set the message in the buffer
  local win = vim.api.nvim_open_win(buffer, true, float_opts)        -- Open the window with the buffer content
  return win
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
