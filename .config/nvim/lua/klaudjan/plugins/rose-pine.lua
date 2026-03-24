return {
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require("rose-pine").setup({
        highlight_groups = {
          Visual = { bg = "#9655aa", inherit = false },
          -- lsp diagnostic highlights that will make the spotting easier
          DiagnosticUnderlineError = { underline = true, bg = "#5b2e3a" },
          DiagnosticUnderlineWarn = { underline = true, bg = "#564a2e" },
          DiagnosticUnderlineInfo = { underline = true, bg = "#314853" },
          DiagnosticUnderlineHint = { underline = true, bg = "#3e3859" },
        },
      })

      vim.cmd(
        'colorscheme rose-pine')
    end
  },
}
