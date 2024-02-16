-- NOTE
-- some other keymaps, plugins specific, may be defined in the "after/plugins" files

vim.g.mapleader = " "  -- leader character
vim.keymap.set("n", "<leader>ft", vim.cmd.Ex, { desc = 'return to [f]ile [t]ree' })

-- Try to prevent bad habits like using the arrow keys for movement.
-- Do this in normal mode...
vim.keymap.set("n", "<Left>", ":echoe 'Use h'<CR>", { desc = 'give error when pressing left arrow' })
vim.keymap.set("n", "<Right>", ":echoe 'Use l'<CR>", { desc = 'give error when pressing right arrow' })
vim.keymap.set("n", "<Up>", ":echoe 'Use k'<CR>", { desc = 'give error when pressing up arrow' })
vim.keymap.set("n", "<Down>", ":echoe 'Use j'<CR>", { desc = 'give error when pressing down arrow' })
-- ...and in insert mode
vim.keymap.set("i", "<Left>", "<ESC>:echoe 'Use h'<CR>", { desc = 'give error when pressing left arrow' })
vim.keymap.set("i", "<Right>", "<ESC>:echoe 'Use l'<CR>", { desc = 'give error when pressing right arrow' })
vim.keymap.set("i", "<Up>", "<ESC>:echoe 'Use k'<CR>", { desc = 'give error when pressing up arrow' })
vim.keymap.set("i", "<Down>", "<ESC>:echoe 'Use j'<CR>", { desc = 'give error when pressing down arrow' })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'move selected lines up' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'move selected lines down' })

vim.keymap.set("n", "J", "mzJ`z", { desc = 'do not move the cursor while appending the lines below'})

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'after moving with C-u center the screen' })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'after moving with C-d center the screen' })

vim.keymap.set("n", "n", "nzzzv", { desc = 'center the screen while going on with searched words' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'center the screen while going upward with searched words' })

-- In this, and other keymaps, we use the 'black hole' register ("_), to
-- delete without coping the text to the yank registry
-- From vim documentation:
-- > Black hole register "_:
-- >     When writing to this register, nothing happens.
-- >     This can be used to delete text without affecting the normal registers.
-- >     When reading from this register, nothing is returned.
--
-- When pasting a word over another
-- you don't loose the firt copied word from the paste registry
-- so you can continuing paste the same word over other words
    vim.keymap.set("x", "<leader>p", "\"_dP", { desc = '[p]aste multiple times the yanked string' })

-- when deleting dont use the copy registry
vim.keymap.set("n", "<leader>d", "\"_d", { desc = '[d]elete without coping the string in the copy registry' })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = '[d]elete without coping the string in the copy registry' })


-- copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = 'copy to clipboard' })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = 'copy to clipboard' })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = 'copy to clipboard' })

-- substitute (all over the file) the word that the cursor is on with whatever your write
vim.keymap.set("n",
               "<leader>s",
               ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
               { desc = 'substitute (all over the file) the word that the cursor is on with whatever your write'}
              )

-- make the file executable
vim.keymap.set("n",
               "<leader>x",
               "<cmd>!chmod +x %<CR>",
               { silent = true, desc = 'Make file e[x]ecutable' }
              )


-- move in quickfix list
vim.keymap.set("n", "<F2>", "<cmd>copen<cr>", { desc = 'open quickfix list' })
vim.keymap.set("n", "<F3>", "<cmd>cnext<cr>", { desc = 'quickfix next item' })
vim.keymap.set("n", "<F4>", "<cmd>cprev<cr>", { desc = 'quickfix previous item' })
vim.keymap.set("n", "<F5>", "<cmd>cclose<cr>", { desc = 'close quickfix list' })

-- highlight current word and all its duplicated around the file
--
-- first we need to activate the highlight for the serached word then, through the pipe, we concatenate
-- the expression that adds the current word to the search registry.
--
-- / registry contains the last searched word, @/ permits to write in this registry
-- \\ lua need thow of those to escape
vim.keymap.set("n", "<leader>h", "<cmd>set hlsearch | let @/='\\V\\<'.escape(expand('<cword>'), '\\').'\\>'<cr>", { desc = '[h]ighlight current word without going to next match' })

-- Found later that with ctrl-g we can print the relative file path, :help ctrl-g for more info
vim.keymap.set("n", "<leader>n", "<cmd>let @+ = expand('%')<cr><cmd>echo @+<cr>", { desc = 'Copy in clipboard and print file path, relative to the workingdir ' })

-- windows management
vim.keymap.set("n", "`h", "<C-W>h", { desc = 'Move to the left window' })
vim.keymap.set("n", "`j", "<C-W>j", { desc = 'Move to the below window' })
vim.keymap.set("n", "`k", "<C-W>k", { desc = 'Move to the above window' })
vim.keymap.set("n", "`l", "<C-W>l", { desc = 'Move to the right window' })
vim.keymap.set("n", "``", "<C-W>w", { desc = 'Move through all opened windows' })
vim.keymap.set("n", "`,", "<C-W><", { desc = 'Make the window horizontally larger' })
vim.keymap.set("n", "`.", "<C-W>>", { desc = 'Make the window horizontally shorter' })

vim.keymap.set("n", "<leader>S", "<cmd>:lua require('klaudjan.utils').get_scratch()<cr>", { desc = 'Open a scratch buffer in a new tab' })

vim.keymap.set("n", "<leader>\"", "<cmd>:lua require('klaudjan.utils').circle()<cr>", { desc = 'Circle the current word with " character' })
vim.keymap.set("n", '<leader>\'', '<cmd>:lua require("klaudjan.utils").circle("\'")<cr>', { desc = 'Circle the current word with \' character' })
vim.keymap.set("n", '<leader>`', '<cmd>:lua require("klaudjan.utils").circle("`")<cr>', { desc = 'Circle the current word with ` character' })
vim.keymap.set("n", "<leader>(", "<cmd>:lua require('klaudjan.utils').circle('(')<cr>", { desc = 'Circle the current word with () characters' })
vim.keymap.set("n", "<leader>)", "<cmd>:lua require('klaudjan.utils').circle(')')<cr>", { desc = 'Circle the current word with () characters' })
vim.keymap.set("n", "<leader><", "<cmd>:lua require('klaudjan.utils').circle('<')<cr>", { desc = 'Circle the current word with <> characters' })
vim.keymap.set("n", "<leader>>", "<cmd>:lua require('klaudjan.utils').circle('>')<cr>", { desc = 'Circle the current word with <> characters' })

-- open same file in a split buffer
vim.keymap.set("n", "<leader>os", "<cmd>split<cr>", { desc = 'open file in horizontal split' })
vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = 'open file in vertical split' })
