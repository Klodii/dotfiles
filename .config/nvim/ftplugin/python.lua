-- line break when reaced a certain limit, resetted the value
-- now the text will not break automatically
vim.opt_local.textwidth = 0

vim.keymap.set("n", "<leader>fd", "?def .*(.*<CR>", { desc = 'go to previouse [f]unction [d]efinition' })
vim.keymap.set("n", "<leader>cd", "?class .*:<CR>", { desc = 'go to previouse [c]lass [d]efinition' })
vim.keymap.set("n", "<leader>B", "Obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() above' })
vim.keymap.set("n", "<leader>b", "obreakpoint()<Esc>", { desc = 'Insert [b]reakpoint() below' })

-- run tests of the current file
vim.keymap.set("n",
  "<leader>t",
  function()
    local currentFile = vim.api.nvim_buf_get_name(0)
    vim.cmd.vnew()      -- open new vertical window
    vim.cmd.term()      -- open terminal
    vim.cmd.wincmd("J") -- move the window below
    vim.api.nvim_win_set_height(0, 15)

    local job_id = vim.bo.channel
    local enter = "\r\n"
    vim.fn.chansend(job_id, { "source scripts/aliases" .. enter })
    vim.fn.chansend(job_id, { "dtest" .. currentFile .. enter })
  end,
  { desc = 'Run current file [t]ests' })
