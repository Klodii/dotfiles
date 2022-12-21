vim.g.mapleader = " "  -- leader character
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)  -- when pressing <leader>pv execute Ex command

-- Try to prevent bad habits like using the arrow keys for movement.
-- Do this in normal mode...
vim.keymap.set("n", "<Left>", ":echoe 'Use h'<CR>")
vim.keymap.set("n", "<Right>", ":echoe 'Use l'<CR>")
vim.keymap.set("n", "<Up>", ":echoe 'Use k'<CR>")
vim.keymap.set("n", "<Down>", ":echoe 'Use j'<CR>")
-- ...and in insert mode
vim.keymap.set("i", "<Left>", "<ESC>:echoe 'Use h'<CR>")
vim.keymap.set("i", "<Right>", "<ESC>:echoe 'Use l'<CR>")
vim.keymap.set("i", "<Up>", "<ESC>:echoe 'Use k'<CR>")
vim.keymap.set("i", "<Down>", "<ESC>:echoe 'Use j'<CR>")
