local builtin = require('telescope.builtin')
-- search in all files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- search only in git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- search in all files for the string specified 
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
