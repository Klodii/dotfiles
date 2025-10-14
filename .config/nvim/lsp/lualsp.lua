-- Server Installation:
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


vim.lsp.config.lualsp = {
  -- Command to start the server
  cmd = { "lua-language-server" },

  -- Filetypes this server should handle
  filetypes = { "lua" },

  -- How to detect the root directory of a Lua project
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },

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
