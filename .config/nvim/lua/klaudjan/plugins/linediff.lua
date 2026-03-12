return {
  'AndrewRadev/linediff.vim',
  config = function()
    vim.keymap.set("v", "<leader>df", ":Linediff<CR>", { desc = 'Add selected text to diff' })
    vim.keymap.set("n", "<leader>dr", "<cmd>LinediffReset<CR>", { desc = 'Stop linediff and close temp buffers' })
  end
}
