local utils = require "klaudjan.utils"

-- line break when reaced a certain limit, resetted the value
-- now the text will not break automatically
vim.opt_local.textwidth = 0

vim.keymap.set("n", "<leader>fd", "?def .*(.*<CR>", { desc = 'go to previouse [f]unction [d]efinition' })
vim.keymap.set("n", "<leader>cd", "?class .*:<CR>", { desc = 'go to previouse [c]lass [d]efinition' })
vim.keymap.set("n", "<leader>B", "Obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() above' })
vim.keymap.set("n", "<leader>b", "obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() below' })
