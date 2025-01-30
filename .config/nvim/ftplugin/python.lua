-- line break when reaced a certain limit, resetted the value
-- now the text will not break automatically
vim.opt_local.textwidth = 0

vim.keymap.set("n", "<leader>fd", "?def .*(.*<CR>", { desc = 'go to previouse [f]unction [d]efinition' })
vim.keymap.set("n", "<leader>cd", "?class .*:<CR>", { desc = 'go to previouse [c]lass [d]efinition' })
vim.keymap.set("n", "<leader>B", "Obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() above' })
vim.keymap.set("n", "<leader>b", "obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() below' })

-- run tests of the current file

---Open a terminal and execute the commands passed
---@param commands string[] list of commands to execute
local open_terminal = function(commands)
  vim.cmd.vnew()      -- open new vertical window
  vim.cmd.term()      -- open terminal
  vim.cmd.wincmd("J") -- move the window below
  vim.api.nvim_win_set_height(0, 15)

  local job_id = vim.bo.channel
  for i = 1, #commands do
    vim.fn.chansend(job_id, { commands[i] })
  end
end

---@class TestPath
---@field file_path string: relative path to of the file
---@field class_ string: name fo the class in which the cursor is
---@field function_ string: name fo the function in which the cursor is
---@field full_test_path string: relative path to file :: class name :: function name

---Return all the information related to the cursor position
---@return TestPath
local build_test_path = function()
  local execute_test = require 'klaudjan.cursor_info'

  local file_path = execute_test.get_relative_file_path()
  local prefix_to_remove = 'application/'
  if string.sub(file_path, 0, #prefix_to_remove) == prefix_to_remove then
    file_path = string.sub(file_path, #prefix_to_remove + 1)
  end

  local names = execute_test.get_class_and_function_name("python")
  local full_test_path = file_path
  if names then
    if names.class_name then
      full_test_path = full_test_path .. "::" .. names.class_name
      if names.function_name then
        full_test_path = full_test_path .. "::" .. names.function_name
      end
    end
  end

  return {
    file_path = file_path,
    class_ = names.class_name,
    function__ = names.functionname,
    full_test_path = full_test_path,
  }
end

---Run the python test of the current file
---@param cursor_specific? boolean if true run the specific test in which the cursor is on
local run_tests = function(cursor_specific)
  cursor_specific = cursor_specific or false

  local test_path = build_test_path()

  local path_to_execute = test_path.file_path
  if cursor_specific == true then
    path_to_execute = test_path.full_test_path
  end

  local enter = "\r\n"
  local commands = { "source scripts/aliases.sh" .. enter, "dtest " .. path_to_execute .. enter }
  open_terminal(commands)
end

vim.keymap.set("n", "<leader>tf", function() run_tests() end, { desc = 'Run file tests' })
vim.keymap.set("n", "<leader>tc", function() run_tests(true) end, { desc = 'Run test under the cursor' })
vim.keymap.set("n", "<leader>tn", function()
    local utils = require 'klaudjan.utils'
    local full_test_path = build_test_path().full_test_path
    utils.copy_to_clipboard(full_test_path)
  end,
  { desc = 'Copy full test name, related to the cursor position' })
