-- Server Installation:
-- All systems: npm install -g typescript typescript-language-server

vim.lsp.config.ts = {
  cmd = { "typescript-language-server", "--stdio" },

  -- Filetypes for which this LSP should attach
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript.jsx",
  },

  -- How to detect the root of a project
  root_markers = {
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
    "node_modules",
    ".git",
  },

  -- Optional: require a workspace (so no launching for single‐files outside a project)
  workspace_required = true,

  -- Settings for the TSLS:
  settings = {
    -- See typescript-language-server docs for options
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayPropertyDeclarationTypeHints = false,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = false,
        includeInlayEnumMemberValueHints = true,
      },
    },
    -- You can also set preferences, disable/enable some validations etc.
    -- For instance:
    -- tsserver = {
    --   ignoreSyntaxErrors = false,
    -- }
  },

  capabilities = require('blink.cmp').get_lsp_capabilities()
}
