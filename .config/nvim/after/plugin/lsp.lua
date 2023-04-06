local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

vim.diagnostic.config({
--    virtual_text = true,
})

vim.keymap.set('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = '[r]ename string all over the project' })

