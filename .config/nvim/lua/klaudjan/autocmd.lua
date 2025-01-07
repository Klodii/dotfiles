local utils = require "klaudjan.utils"

-- Automatically delete all trailing whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", { command = [[%s/\s\+$//e]] })

-- Recompile suckless programs Automatically
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "config.h", "config.def.h" },
  command = "!sudo make clean install"
})

-- Recompile latex programs Automatically
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.tex" },
  command = "!pdflatex %"
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- if you are usign tmux, make sure to
-- set -g focus-events on
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  desc = "Automatically reload the buffer if the file has changed externally (e.g. due to a `git pull`)",
  callback = function()
    local message = 'File changed ⚠'
    local floating_buf = utils.open_floating_window({ message = message, width = #message, height = 1 })
    vim.api.nvim_buf_set_keymap(floating_buf, 'n', 'q', '<cmd>q<CR>', {})
  end,
})
