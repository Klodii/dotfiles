local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]ile}' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[s]earch only in [g]it files' })
vim.keymap.set('n', '<leader>sw', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = '[s]earch in all files the [w]ord specified' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch in [h]elp tags' })
vim.keymap.set('n', '<leader>sk', '<cmd>Telescope keymaps<cr>', { desc = 'search [k]eymap' })
