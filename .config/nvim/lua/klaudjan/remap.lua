-- NOTE
-- some other keymaps, plugins specific, may be defined in the "after/plugins" files

vim.g.mapleader = " " -- <Space> leader character

local keymap = vim.keymap.set
keymap("n", "<leader>ft", ":Lexplore %:p:h<CR>", { desc = 'return to file tree' }) -- Lex stands for Lexplorer

-- Try to prevent bad habits like using the arrow keys for movement.
-- Do this in normal mode...
keymap("n", "<Left>", ":echoe 'Use h'<CR>", { desc = 'give error when pressing left arrow' })
keymap("n", "<Right>", ":echoe 'Use l'<CR>", { desc = 'give error when pressing right arrow' })
keymap("n", "<Up>", ":echoe 'Use k'<CR>", { desc = 'give error when pressing up arrow' })
keymap("n", "<Down>", ":echoe 'Use j'<CR>", { desc = 'give error when pressing down arrow' })
-- ...and in insert mode
keymap("i", "<Left>", "<ESC>:echoe 'Use h'<CR>", { desc = 'give error when pressing left arrow' })
keymap("i", "<Right>", "<ESC>:echoe 'Use l'<CR>", { desc = 'give error when pressing right arrow' })
keymap("i", "<Up>", "<ESC>:echoe 'Use k'<CR>", { desc = 'give error when pressing up arrow' })
keymap("i", "<Down>", "<ESC>:echoe 'Use j'<CR>", { desc = 'give error when pressing down arrow' })

keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = 'move selected lines up' })
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = 'move selected lines down' })

keymap("n", "J", "mzJ`z", { desc = 'do not move the cursor while appending the lines below' })

keymap("n", "<C-u>", "<C-u>zz", { desc = 'after moving with C-u center the screen' })
keymap("n", "<C-d>", "<C-d>zz", { desc = 'after moving with C-d center the screen' })

keymap("n", "n", "nzzzv", { desc = 'center the screen while going on with searched words' })
keymap("n", "N", "Nzzzv", { desc = 'center the screen while going upward with searched words' })

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
keymap("x", "<leader>p", "\"_dP", { desc = '[p]aste multiple times the yanked string' })

-- when deleting dont use the copy registry
keymap("n", "<leader>d", "\"_d", { desc = '[d]elete without coping the string in the copy registry' })
keymap("v", "<leader>d", "\"_d", { desc = '[d]elete without coping the string in the copy registry' })


-- copy to clipboard
keymap("n", "<leader>y", "\"+y", { desc = 'copy to clipboard' })
keymap("v", "<leader>y", "\"+y", { desc = 'copy to clipboard' })
keymap("n", "<leader>Y", "\"+Y", { desc = 'copy to clipboard' })

-- substitute (all over the file) the word that the cursor is on with whatever your write
keymap("n",
  "<leader>s",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = 'substitute (all over the file) the word that the cursor is on with whatever your write' }
)

keymap("n", "<leader>so", "<cmd>source %<CR>", { desc = 'Source the file, e[x]ecute it' })
keymap("n", "<leader>x", "<cmd>:lua require('klaudjan.execute').execute_file()<cr>",
  { desc = 'Execute the file' })
keymap("n", "<leader>l", ":.lua<CR>", { desc = 'Execute in [l]ua the current line (where the cursor is)' })
keymap("v", "<leader>l", ":lua<CR>", { desc = 'Execute in [l]ua the selected lines' })
-- file maps
keymap("n", "<leader><leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make file e[x]ecutable' }
)
keymap("n", "<leader>w", "<cmd>w<CR>", { silent = true, desc = 'Save ([W]rite) File' }
)
keymap("n", "<leader>q", "<cmd>q<CR>", { silent = true, desc = '[Q]uit file/editor' })
keymap("n", "<leader>e", "<cmd>e<CR>", { silent = true, desc = 'Open the file out are in, it refreshes the file' })


-- move in quickfix list
keymap("n", "<F2>", "<cmd>copen<cr>", { desc = 'open quickfix list' })
keymap("n", "<F3>", "<cmd>cnext<cr>", { desc = 'quickfix next item' })
keymap("n", "<F4>", "<cmd>cprev<cr>", { desc = 'quickfix previous item' })
keymap("n", "<F5>", "<cmd>cclose<cr>", { desc = 'close quickfix list' })

-- highlight current word and all its duplicated around the file
--
-- first we need to activate the highlight for the serached word then, through the pipe, we concatenate
-- the expression that adds the current word to the search registry.
--
-- / registry contains the last searched word, @/ permits to write in this registry
-- \\ lua need thow of those to escape
keymap("n", "<leader>h", "<cmd>set hlsearch | let @/='\\V\\<'.escape(expand('<cword>'), '\\').'\\>'<cr>",
  { desc = '[h]ighlight current word without going to next match' })

-- Found later that with ctrl-g we can print the relative file path, :help ctrl-g for more info
keymap("n", "<leader>n", "<cmd>let @+ = expand('%')<cr><cmd>echo @+<cr>",
  { desc = 'Copy in clipboard and print file path, relative to the workingdir ' })

-- windows management
keymap("n", "`h", "<C-W>h", { desc = 'Move to the left window' })
keymap("n", "`j", "<C-W>j", { desc = 'Move to the below window' })
keymap("n", "`k", "<C-W>k", { desc = 'Move to the above window' })
keymap("n", "`l", "<C-W>l", { desc = 'Move to the right window' })
keymap("n", "``", "<C-W>w", { desc = 'Move through all opened windows' })
keymap("n", "`,", "<C-W><", { desc = 'Make the window horizontally larger' })
keymap("n", "`.", "<C-W>>", { desc = 'Make the window horizontally shorter' })

keymap("n", "<leader>\"", "<cmd>:lua require('klaudjan.utils').circle()<cr>",
  { desc = 'Circle the current word with " character' })
keymap("n", '<leader>\'', '<cmd>:lua require("klaudjan.utils").circle("\'")<cr>',
  { desc = 'Circle the current word with \' character' })
keymap("n", '<leader>`', '<cmd>:lua require("klaudjan.utils").circle("`")<cr>',
  { desc = 'Circle the current word with ` character' })
keymap("n", "<leader>(", "<cmd>:lua require('klaudjan.utils').circle('(')<cr>",
  { desc = 'Circle the current word with () characters' })
keymap("n", "<leader>)", "<cmd>:lua require('klaudjan.utils').circle(')')<cr>",
  { desc = 'Circle the current word with () characters' })
keymap("n", "<leader><", "<cmd>:lua require('klaudjan.utils').circle('<')<cr>",
  { desc = 'Circle the current word with <> characters' })
keymap("n", "<leader>>", "<cmd>:lua require('klaudjan.utils').circle('>')<cr>",
  { desc = 'Circle the current word with <> characters' })

-- open same file in a split buffer
keymap("n", "<leader>os", "<cmd>split<cr>", { desc = 'open file in horizontal split' })
keymap("n", "<leader>vs", "<cmd>vsplit<cr>", { desc = 'open file in vertical split' })

-- Terminal mode ":temr"
keymap('t', '<leader><esc>', '<C-\\><C-N>', { silent = true })   -- exit
keymap('t', '<C-Left>', '<C-\\><C-N><C-w>h', { silent = true })  -- move left
keymap('t', '<C-Down>', '<C-\\><C-N><C-w>j', { silent = true })  -- move down
keymap('t', '<C-Up>', '<C-\\><C-N><C-w>k', { silent = true })    -- move up
keymap('t', '<C-Right>', '<C-\\><C-N><C-w>l', { silent = true }) -- move right

-- Diagnostics
keymap("n", "<leader>dc", "<cmd>:lua vim.diagnostic.open_float()<cr>", { desc = 'Open diagnostic under the cursor' })
keymap("n", "<leader>dn", "<cmd>:lua vim.diagnostic.goto_next()<cr>", { desc = 'Go to netxt diagnostic' })
keymap("n", "<leader>dp", "<cmd>:lua vim.diagnostic.goto_prev()<cr>", { desc = 'Go to netxt diagnostic' })

vim.keymap.set('n', '<leader>er', function()
  local release_notes_path = os.getenv("RELEASE_NOTES")
  if release_notes_path then
    vim.cmd('edit ' .. release_notes_path)
  else
    vim.notify("RELEASE_NOTES env variable not set", vim.log.levels.ERROR, {
      title = "System Env Error"
    })
  end
end, { desc = 'edit release notes file' })
