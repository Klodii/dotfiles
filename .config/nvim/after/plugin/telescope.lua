local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]ile}' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'search only in [g]it [f]iles' })
vim.keymap.set('n', '<leader>ss', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = '[s]earch in all files the [s]tring specified' })
vim.keymap.set('n', '<leader>km', '<cmd>Telescope keymaps<cr>', { desc = 'list all [k]ey[m]aps' })
