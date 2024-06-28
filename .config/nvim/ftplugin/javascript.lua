-- line break when reaced a certain limit, resetted the value
-- now the text will not break automatically
vim.opt.textwidth = 0

vim.keymap.set("n", "<leader>B", "Odebugger;<Esc>", { desc = 'Insert [b]reakpoint above' })
vim.keymap.set("n", "<leader>b", "odebugger;<Esc>", { desc = 'Insert [b]reakpoint below' })
