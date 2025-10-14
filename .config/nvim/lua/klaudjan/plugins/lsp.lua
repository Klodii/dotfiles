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
      -- Starting the lsp that we defined in the /lsp directory
      vim.lsp.enable("lualsp")
      vim.lsp.enable("pyright")
      vim.lsp.enable("bashls")
      vim.lsp.enable("ltex")
      vim.lsp.enable("ts")


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
