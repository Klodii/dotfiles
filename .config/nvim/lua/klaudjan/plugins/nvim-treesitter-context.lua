return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    require 'treesitter-context'.setup({
      multiline_threshold = 1, -- Maximum number of lines to show for a single context
    })
  end
}
