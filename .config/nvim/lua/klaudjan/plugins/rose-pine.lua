return {
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        highlight_groups = {
          Visual = { bg = "#9655aa", inherit = false },
        },
      })

      vim.cmd(
        'colorscheme rose-pine')
    end
  },
}
