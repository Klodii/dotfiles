local lsp_zero = require('lsp-zero')

lsp_zero.setup()
vim.diagnostic.config({
    virtual_text = false, -- remove the virtualtext next to the error line
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

vim.keymap.set('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = '[r]ename string all over the project' })

