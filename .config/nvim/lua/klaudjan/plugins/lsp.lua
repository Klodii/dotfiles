return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        -- this will add `vim` object in the path, so we will not get
        -- error for `vim.` rows and also add the autocomplitions
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- LSP SERVER INTSALLATIONS
      -- To find the lsp server type:
      -- `:help lspconfig-all`
      require("lspconfig").lua_ls.setup {} -- the server must be already installed in the machine (in arch: yay -S lua-language-server)

      -- KEYBINDINGS
      vim.keymap.set('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<cr>",
        { desc = '[r]ename string all over the project' })

      -- AUTOCOMMANDS
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/fomratting') then
            -- format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                -- format will use the lsp server and also .editorconfig
                -- to format the file
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end
      })
    end
  }
}
