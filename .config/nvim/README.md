## Project composition
- **after**, all the files that are here will be executed after the
  configuration is up
- **init.lua**, first file that is read by nvim
- **lua**, folder in which are located all the keymaps, options, autocommands and
plugin definitions
- **pfplugin**: in this folder are located configurations for specific file
  types. The configurations will be loaded when the relative filetype is loaded
  (the configuration remain loaded even you change file with a different file
  type). If the configurations are not loaded make sure that you have  set
  `:filetype on` and
`:filetype plugin on`

## Checkhealt
To optimize or check if there are some warnings or errors run `:checkhealt`.
If there is any error, try to run `:TSUpdate`, the update might fix the error.
To install a new LSP server go to the plugin file configuration
`lua/klaudjan/plugins/lsp.lua`, and to search which server to install you can
check the list by typing `:help lspconfig-all`.


## Language Server Protocol (LSP)
LSP is used to make nvim understand the language you are using and giving you
suggestion messages.

### LSP servers that I use
You may need to install `npm` to install these servers through Mason
- lua_ls: lua
- pyright: Python
- bash-language-server: Bash
- ltex-ls: Text, Markdown, LaTeX
- ts_ls: TypeScript, JavaScript
- dockerfile-language-server: Docker
- html-lsp: HTML
- json-lsp: JSON
- sqlls: SQL
- vim-language-server: VimScript

## Useful tricks
My tips and tricks are written in `mytips.txt`.

It is possible to open the file via help message by following these steps:
1. create `~/.local/share/nvim/site/doc/` directory, if it does not exist yet.
2. create a symlink to the help file `doc/mytips.txt` into `~/.local/share/nvim/site/doc/`
    `ln -s ~/.config/nvim/doc/mytips.txt ~/.local/share/nvim/site/doc/`
3. from nvim execute `:helptags ~/.local/share/nvim/site/doc/`
4. run `:help local-additions` to check if the document has been added
5. now it is possible to open the new help file via `:help mytips`

These steps are better explained in `:help write-local-help`
