return {
  {
    "Klodii/scratch.nvim",
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>S', '<cmd>ScratchTab<CR>',
        { desc = 'Open a scratch buffer in a new tab', noremap = true, silent = true })
    end
  }
}
