-- LSP Server Installation:
-- All systems: sudo npm install -g typescript typescript-language-server

local root_files = {
        "package.json",
        "tsconfig.json",
        "jsconfig.json",
        "node_modules",
        ".git",
}

-- This finds the directory containing one of the files above
local root_file = vim.fs.find(root_files, { upward = true })[1]
local root_dir = root_file and vim.fs.dirname(root_file) or vim.fn.getcwd()

-- LSP START
vim.lsp.start({
      cmd = { "typescript-language-server", "--stdio" },
      root_dir = root_dir,

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
)
