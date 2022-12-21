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

-- Move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- After moving with C-u or C-d center the screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Center the screen while going on with searched words
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When paisting a word over another
-- you don't loose the firt copied word from the paste registry
-- so you can continuing paste the same word over other words
vim.keymap.set("x", "<leader>p", "\"_dP")
