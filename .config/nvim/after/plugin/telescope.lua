-- telescope plugins must be loaded
require("telescope").load_extension "file_browser"


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]ile}' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[s]earch only in [g]it files' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch in [h]elp tags' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'search [k]eymap' })
vim.keymap.set('n', '<leader>b', "<cmd>Telescope file_browser<cr>", { desc = '[b]rowse files' })
vim.keymap.set('n', '<leader>gr', "<cmd>Telescope lsp_references<cr>", { desc = '[g]o to [r]eferences' })
vim.keymap.set('n', '<leader>gd', "<cmd>Telescope lsp_definitions<cr>", { desc = '[g]o to [d]efinitios' })

vim.keymap.set('n',
               '<leader>sw',
               function()
                   builtin.grep_string({ search = vim.fn.input("Grep > ") });
               end,
               { desc = '[s]earch in all files the [w]ord specified' }
              )

vim.keymap.set('n',
               '<leader>en',
               function()
                   builtin.find_files({ cwd = '~/.config/nvim' });
               end,
               { desc = '[e]dit a [n]eovim configuration file' }
              )
