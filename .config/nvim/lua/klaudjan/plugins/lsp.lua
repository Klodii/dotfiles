return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
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
      -- tell to the lsp that it can use our autocomplete: blink
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      -- LSP SERVER INTSALLATIONS
      -- To find the lsp server type:
      -- `:help lspconfig-all`
      -- the server must be already installed in the machine
      --
      -- Arch: yay -S lua-language-server
      -- MacOs: brew install lua-language-server
      require 'lspconfig'.lua_ls.setup { capabilities = capabilities }
      -- All systems: sudo npm install -g pyright
      require 'lspconfig'.pyright.setup { capabilities = capabilities }
      -- Arch: sudo pacman -S bashls
      -- MacOs: npm install -g bash-language-server
      require 'lspconfig'.bashls.setup { capabilities = capabilities }
      -- Arch: yay -S ltex-ls
      -- MacOs: brew install ltex-ls
      require 'lspconfig'.ltex.setup { capabilities = capabilities }
      -- All systems: npm install -g typescript typescript-language-server
      require 'lspconfig'.ts_ls.setup { capabilities = capabilities }


      -- AUTOCOMMANDS
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          -- KEYBINDINGS
          -- Keymaps scoped to LSP-attached buffers
          local function nmap(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
          end
          nmap("gd", vim.lsp.buf.definition, "Go to Definition")
          nmap("gr", vim.lsp.buf.references, "Find References")
          nmap("<leader>r", vim.lsp.buf.rename, "Rename Symbol")

          if client.supports_method('textDocument/formatting') then
            -- format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              callback = function()
                -- format will use the lsp server and also .editorconfig
                -- to format the file
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end
      })

      vim.diagnostic.config({
        virtual_lines = { current_line = true }, -- show diagnostic messages when cursor in the line
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Show diagnostics on CursorHold: if the cursor stays on the line for
      -- sometime without doing anything
      -- vim.api.nvim_create_autocmd("CursorHold", {
      --   callback = function()
      --     vim.diagnostic.open_float(nil, { focusable = false })
      --   end,
      -- })
    end
  }
}
