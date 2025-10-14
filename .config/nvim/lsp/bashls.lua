-- Server Installation:
-- Arch: sudo pacman -S bashls
-- MacOs: npm install -g bash-language-server

vim.lsp.config.bashls = {
  -- Command to start bash-language-server
  cmd = { "bash-language-server", "start" },

  -- File types this server should attach to
  filetypes = { "sh", "bash" },

  -- How to detect the project root
  root_markers = { ".git", ".bashrc", ".profile" },

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
