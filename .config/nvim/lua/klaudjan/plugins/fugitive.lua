return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = '[g]it [s]tatus' });
    vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = '[g]it [b]lame' });
  end
}
