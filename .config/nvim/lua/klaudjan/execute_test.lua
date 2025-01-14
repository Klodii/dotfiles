local utils = require "klaudjan.utils"
local M = {}

M.get_floating_terminal = function()
  local current_width = vim.api.nvim_get_option_value('columns', {})
  local current_height = vim.api.nvim_get_option_value('lines', {})

  local float_opts = {
    relative = 'editor',
    width = math.floor(current_width * 0.5),
    height = math.floor(current_height * 0.5),
    row = 5,
    col = math.floor(current_width * 0.2),
    style = 'minimal',  -- Minimal window style with no borders or other decorations
    border = 'rounded', -- Optional: Adds rounded borders
  }

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_call(buf, function()
    vim.api.nvim_command("term") -- open terminal
  end
  )
  vim.api.nvim_open_win(buf, true, float_opts)
end

M.get_floating_terminal()
return M
