vim.keymap.set("n", "<leader>fd", "?def .*(.*<CR>", { desc = 'go to previouse [f]unction [d]efinition' })
vim.keymap.set("n", "<leader>cd", "?class .*:<CR>", { desc = 'go to previouse [c]lass [d]efinition' })
vim.keymap.set("n", "b", "Obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() above' })
