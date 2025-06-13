local utils = require "klaudjan.utils"
local log = require "plenary.log":new()
log.level = 'debug'
local M = {}

M.commands = {
  lua = 'lua',
  sh = "bash",
  python = 'python',
}

--- Setup user configuration
-- @param opts Table with optional `commands` override
function M.setup(opts)
  opts = opts or {}
  if opts.commands then
    M.commands = vim.tbl_extend("force", M.commands, opts.commands)
  end
end

--- Executes the current file using a command mapped to its filetype.
-- The command is defined in `M.commands[filetype]` and run with the file's absolute path.
-- Logs and prints the command output.
-- Assumes the current buffer is saved to disk.-@return string
M.execute_file = function()
  local filepath = vim.fn.expand('%:p') -- absolute path
  local filetype = utils.get_file_type()
  local command = M.commands[filetype]

  if not command then
    print("No command found for filetype: " .. filetype)
    return
  end

  local shell_command = command .. " " .. filepath
  log.debug("Running command " .. shell_command)

  local output = vim.fn.system(shell_command)
  log.debug("Output:\n" .. output)
  print(output)
end
return M
