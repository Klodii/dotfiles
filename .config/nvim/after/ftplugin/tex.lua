-- LSP Server Installation:
-- Arch: yay -S ltex-ls
-- MacOs: brew install ltex-ls

local root_files = { ".git" }

-- This finds the directory containing one of the files above
local root_file = vim.fs.find(root_files, { upward = true })[1]
local root_dir = root_file and vim.fs.dirname(root_file) or vim.fn.getcwd()

-- LSP START
vim.lsp.start({
      cmd = { "ltex-ls" },
      root_dir = root_dir,

      settings = {
        ltex = {
          -- Which languages to enable LTeX in
          language = "en-US",  -- change to your default locale, e.g. "it", "de-DE", etc.

          -- For which code / markup filetypes enable checks
          enabled = { "markdown", "plaintex", "rst", "tex", "latex" },

          -- How often to run checks: on edit, on save, or manual
          checkFrequency = "save",

          -- Logging verbosity
          logLevel = "info",  -- options: "severe", "warning", "info", "config", "fine", "finer", "finest"

          -- Additional rules/settings
          additionalRules = {
            enablePickyRules = true,
            -- motherTongue = "en-US", -- if needed for specific grammar rules
            -- languageModel = "/path/to/language_model", -- optional n-gram language model
          },

          -- If using an external LanguageTool HTTP server (premium or self-hosted)
          -- languageToolHttpServerUri = "https://api.languagetool.org", -- e.g.

          -- Java settings (heap size etc) if needed
          java = {
            initialHeapSize = 64,     -- in MB
            maximumHeapSize = 512,     -- in MB
            -- path = "/path/to/java"    -- if not using the bundled Java
          },

          -- Configure severity of diagnostics
          diagnosticSeverity = "information",  -- or an object to map specific rules to different levels

          -- Etc: you can also disable particular rules, enable/disable spellchecking in certain environments, etc.
        }
      },

      capabilities = require('blink.cmp').get_lsp_capabilities()
    }
)
