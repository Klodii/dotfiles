-- LSP Server Installation:
-- Arch: yay -S lua-language-server
-- MacOs: brew install lua-language-server
-- Fedora:
--        - install dependencies:
--                  - sudo dnf install gcc gcc-c++ ninja-build cmake git libstdc++-static
--        - clone repository:
--                  - git clone https://github.com/LuaLS/lua-language-server.git
--                  - cd lua-language-server
--        - build it:
--                  - ./make.sh
--        - install/deploy:
--                  - sudo mv <cloned-dir> /opt/lua-language-server
--                  - sudo ln -s /opt/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
--        - test:
--                  - lua-language-server --version

local root_files = {
      ".luarc.json",
      ".luarc.jsonc",
      ".luacheckrc",
      ".stylua.toml",
      "stylua.toml",
      "selene.toml",
      "selene.yml",
      ".git",
}

-- This finds the directory containing one of the files above
local root_file = vim.fs.find(root_files, { upward = true })[1]
local root_dir = root_file and vim.fs.dirname(root_file) or vim.fn.getcwd()

-- START LSP
vim.lsp.start({
    cmd = { "lua-language-server" },
    root_dir = root_dir,

    -- Optional settings for the server
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server what Lua version you're using
          version = "LuaJIT", -- Neovim uses LuaJIT

          -- Setup your lua path -- include your paths for modules
          path = vim.split(package.path, ";"),
          -- You might also append more, e.g.:
          -- table.insert(path, "lua/?.lua")
          -- table.insert(path, "lua/?/init.lua")
        },

        diagnostics = {
          -- Recognize the `vim` global
          globals = { "vim" },

          -- You may want to disable some diagnostic types
          -- e.g. unused-local, lower-case-global, etc.
        },

        workspace = {
          -- Make the server aware of Neovim runtime files,
          -- so you get completion and help for builtins
          library = vim.api.nvim_get_runtime_file("", true),
          -- optionally disable / filter certain folders
        },

        formatting = {
          -- Example: use stylua's settings
          enable = true,
          -- etc
        },

        telemetry = {
          enable = false, -- do not send telemetry data
        },
      },
    },

    capabilities = require('blink.cmp').get_lsp_capabilities()
  }
)
