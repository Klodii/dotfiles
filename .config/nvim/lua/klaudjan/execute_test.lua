---@class Names
---@field class_name string?: the class name
---@field function_name string?: the function name

local M = {}

M.class_types = {
  python = 'class_definition',
  java_script = 'class_declaration',
  cpp = 'class_specifier',
}

---Open a new buffer, which starts a terminal, in a floating window
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

---Return the name of the class and function in which the cursor is
---@param language string
---@return Names
M.get_class_and_function_name = function(language)
  local class_type = M.class_types[language]

  local current_node = vim.treesitter.get_node()

  if not current_node then
    return ""
  end

  local node = current_node
  local function_node = nil
  local class_node = nil
  while node do
    if not function_node and node:type() == 'function_definition' then
      function_node = node
    end
    if not class_node and node:type() == class_type then
      class_node = node
    end
    node = node:parent()
  end

  ---@type Names
  local names = { class_name = nil, function_name = nil }
  if function_node then
    names['function'] = vim.treesitter.get_node_text(function_node:child(1), 0)
  end
  if class_node then
    names['class'] = vim.treesitter.get_node_text(class_node:child(1), 0)
  end
  return names
end

--- Get the relative, to the working directory, path of the current file
---@return string
M.get_relative_file_path = function()
  local filepath = vim.fn.expand('%:p') -- absolute path
  local cwd = vim.fn.getcwd()
  local relative_path = filepath:sub(#cwd + 2)
  return relative_path
end

return M
