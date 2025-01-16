local M = {}

M.class_types = {
  python = 'class_definition',
  java_script = 'class_declaration',
  cpp = 'class_specifier',
}


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

  local final_message = ""
  if function_node then
    local function_node_name = vim.treesitter.get_node_text(function_node:child(1), 0)
    final_message = final_message .. " function: " .. function_node_name
  end
  if class_node then
    local class_node_name = vim.treesitter.get_node_text(class_node:child(1), 0)
    final_message = final_message .. " class: " .. class_node_name
  end
  print(final_message)
end

--M.get_floating_terminal()
--M.get_class_and_function_name('python')
return M
