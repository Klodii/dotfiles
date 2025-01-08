local utils = require("klaudjan.utils")

local M = {}
local buf = nil

--- Creates a scratch buffer in a floating window
--- the buffer will not be able to be saved
--- the buffer will have the markdown filetype
M.open_scratch_tab = function()
  -- create scrap buffer
  if not buf then
    buf = vim.api.nvim_create_buf(false, true)
    vim.opt_local.buftype = 'nofile'
    vim.opt_local.bufhidden = 'hide'
    vim.opt_local.swapfile = false -- do not create a swap file
    vim.bo[buf].filetype = 'markdown'
  end

  vim.api.nvim_command('tabnew')
  vim.api.nvim_set_current_buf(buf) -- Set the buffer in the new tab
end

vim.api.nvim_set_keymap('n', '<leader>S', ':lua require("klaudjan.scratch").open_scratch_tab()<CR>',
  { desc = 'Open a scratch buffer in a new tab', noremap = true, silent = true })

return M
