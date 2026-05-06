-- Use the same LSP of typescript
vim.cmd.source(vim.fn.stdpath("config") .. "/after/ftplugin/typescript.lua")

-- line break when reaced a certain limit, resetted the value
-- now the text will not break automatically
vim.opt_local.textwidth = 0

vim.keymap.set("n", "<leader>B", "Odebugger;<Esc>", { desc = 'Insert [b]reakpoint above' })
vim.keymap.set("n", "<leader>b", "odebugger;<Esc>", { desc = 'Insert [b]reakpoint below' })
