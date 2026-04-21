-- LSP Server Installation:
-- Arch: sudo pacman -S bashls
-- All systems: sudo npm install -g bash-language-server

local root_files = { ".git", ".bashrc", ".profile" }

-- This finds the directory containing one of the files above
local root_file = vim.fs.find(root_files, { upward = true })[1]
local root_dir = root_file and vim.fs.dirname(root_file) or vim.fn.getcwd()

-- START LSP
vim.lsp.start({
      cmd = { "bash-language-server", "start" },
      root_dir = root_dir,

      -- Optional additional settings (if bash-language-server supports them via settings or init_options)
      settings = {
        -- e.g. configure which linters / formatters to use (shellcheck / shfmt) if installed
        -- The bash-language-server docs mention it will auto-detect shellcheck and shfmt. :contentReference[oaicite:0]{index=0}
        bash = {
          lint = {
            enabled = true,
            -- shellcheck arguments could go here, for example
            -- args = { "--some-flag", "value" },
          },
          format = {
            enabled = true,
            -- maybe options for shfmt; e.g. indent style, etc.
          },
        },
      },

      capabilities = require('blink.cmp').get_lsp_capabilities()
    }
)
