-- line break when reaced a certain limit, resetted the value
-- now the text will not break automatically
vim.opt_local.textwidth = 0

vim.keymap.set("n", "<leader>fd", "?def .*(.*<CR>", { desc = 'go to previouse [f]unction [d]efinition' })
vim.keymap.set("n", "<leader>cd", "?class .*:<CR>", { desc = 'go to previouse [c]lass [d]efinition' })
vim.keymap.set("n", "<leader>B", "Obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() above' })
vim.keymap.set("n", "<leader>b", "obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() below' })

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

-- run tests of the current file
vim.keymap.set("n",
  "<leader>t",
  function()
    local execute_test = require 'klaudjan.execute_test'

    local file_path = execute_test.get_relative_file_path()
    local prefix_to_remove = 'application/'
    if string.sub(file_path, 0, #prefix_to_remove) == prefix_to_remove then
      file_path = string.sub(file_path, #prefix_to_remove + 1)
    end

    local enter = "\r\n"
    local commands = { "source scripts/aliases.sh" .. enter, "dtest " .. file_path .. enter }
    open_terminal(commands)
  end,
  { desc = 'Run current file tests' })


vim.keymap.set("n", "<leader>tt", function()
    local execute_test = require 'klaudjan.execute_test'

    local file_path = execute_test.get_relative_file_path()
    local prefix_to_remove = 'application/'
    if string.sub(file_path, 0, #prefix_to_remove) == prefix_to_remove then
      file_path = string.sub(file_path, #prefix_to_remove + 1)
    end

    local names = execute_test.get_class_and_function_name("python")
    if names then
      if names.class_name then
        file_path = file_path .. "::" .. names.class_name
        if names.function_name then
          file_path = file_path .. "::" .. names.function_name
        end
      end
    end

    local enter = "\r\n"
    local commands = { "source scripts/aliases.sh" .. enter, "dtest " .. file_path .. enter }
    open_terminal(commands)
  end,
  { desc = 'Run current function test' })
