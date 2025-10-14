-- Server Installation:
-- All systems: sudo npm install -g pyright
-- require 'lspconfig'.pyright.setup { capabilities = capabilities }

vim.lsp.config.pyright = {
  -- Command to start the server
  cmd = { "pyright-langserver", "--stdio" },

  -- Filetypes for which this server is relevant
  filetypes = { "python" },

  -- How to detect the root directory of a project
  -- Root markers, e.g. files/folders that indicate project root
  root_markers = {
    "pyrightconfig.json",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },

  -- Settings specific to Pyright
  settings = {
    python = {
      analysis = {
        -- controls strictness
        typeCheckingMode = "basic",  -- could be "strict", "module", "off", etc.
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,

        -- Example: override diagnostic severity
        diagnosticSeverityOverrides = {
          reportOptionalMemberAccess = "warning",
          reportUndefinedVariable = "error",
          -- add more overrides as needed
        },

        -- Example: extraPaths: where to look for imports, etc.
        extraPaths = { "src", "lib" },

        -- Could include more like: stubPath, diagnosticMode, etc.
      },
    },
  },
  capabilities = require('blink.cmp').get_lsp_capabilities()
}
