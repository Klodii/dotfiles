return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    vim.opt.termguicolors = true -- required by notify
    require('nvim-highlight-colors').setup({})
  end
}
