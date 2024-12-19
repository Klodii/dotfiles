return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
  },
  config = function()
    require("telescope").setup({
      defaults = {
        preview = {
          filesize_limit = 0.1, -- MB
        },
      },
      extensions = { fzf = {} },
    })

    require('telescope').load_extension('fzf')

    -- When in telescope window if you press CTRL-/ you will open the Keymaps helper

    local multigrep = require "klaudjan.telescope_multigrep"
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf', function() builtin.find_files({ hidden = true, no_ignore = true }) end,
      { desc = '[s]earch [f]ile}' })
    vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[s]earch only in [g]it files' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch in [h]elp tags' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'search [k]eymap' })
    vim.keymap.set('n', '<leader>gr', "<cmd>Telescope lsp_references<cr>", { desc = '[g]o to [r]eferences' })
    vim.keymap.set('n', '<leader>gd', "<cmd>Telescope lsp_definitions<cr>", { desc = '[g]o to [d]efinitios' })

    vim.keymap.set('n',
      '<leader>sw',
      function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end,
      { desc = '[s]earch in all files the [w]ord specified' }
    )
    vim.keymap.set('n', '<leader>rw', multigrep.live_multigrep, { desc = '[R]ipGrep in all files the [w]ord specified' })

    vim.keymap.set('n',
      '<leader>en',
      function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") });
      end,
      { desc = '[e]dit a [n]eovim configuration file' }
    )
    vim.keymap.set('n',
      '<leader>ep',
      function()
        local packer_installation_directory = "site/pack/packer/start"
        builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), packer_installation_directory) });
      end,
      { desc = '[e]dit a [p]package file' }
    )
  end
}
