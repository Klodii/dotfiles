## How to install plugins
The plugin manager is [Lazy](https://github.com/folke/lazy.nvim), it should
install itself, otherwise go to the Github page.

## Project composition
- **after**, all the files that are here will be executed after the
  configuration is up
- **init.lua**, first file that is read by Nvim
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
If there is any error, try to run `:TSUpdate`, the udpate might fix the error.
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



# VIM usefull keys
`^` = `Ctrl`

Open URL or files
    - Normal mode: `gx` opens the file or the URL in your default browser

Movements
    Visual mode: `0` goes to beginning of the line
    Visual mode: `_` or `^` goes to first non-blank character of the line
    Visual mode: `g_` goes to the last non-blank character of the line
    Visual mode: `_vg_` will select from first non-blank character to last non-blank character

Indentation
    - Insert mode: `^-t`, `^-d` to indent current line forward, backwords
    - Visual mode: `>`, `<` to indent current line forward, backwords
    - Visual mode: `=` to make vim autoindent correctly the selected rows

Format only long lines
    In Vim, you may want to format long lines, that is, wrap long lines so the
    longest is, say, 80 characters.
    The standard approach is to set the local 'textwidth' option (see the
    options configuration), then use `gq` to format the wanted lines.

    example:
    ```
    :setl tw=80
    gggqG
    ```

    In the above, gggqG is gg (go to the first line) then gq (format) to G (the
    last line). That works, but it also joins consecutive short lines together
    although it does not join lines that are separated with an empty line. For
    example, this text:
    For more, visit https://vim.fandom.com/wiki/Format_only_long_lines#:~:text=In%20Vim%2C%20you%20may%20want,to%20format%20the%20wanted%20lines.&text=In%20the%20above%2C%20gggqG%20is,G%20(the%20last%20line).

Upper/Lower case
    - Normal mode:
        - `~` change to upper/lower case the character under the cursor
        - `gu<movement>` to make lowercase all character found in the movement
        - `gU<movement>` to make uppercase all character found in the movement

Record commands
    - Normal mode:
        - `q<a-z>` to begin record all keys and commands executed. The recording
                   goes to the <a-z> character selected (aka the alphanumeric
                   register selected).
        - `@<a-z><movement>` to execute the recorded commands
Registers:
    - To list all registers content: `:registers` or `:reg`
    - To paste the content of a register X:
        - Normal mode: `"Xp"`
        - Insert mode: `<^-r>X"
    - To yank (copy) to a specific register you have to prepend your yank
      command with the register name X:
        - Normal mode: `"Xyw` (to yank the word to the register X)

Suggestion window that appear while you are typing
    - Insert mode:
        - `^-e` to open/close the suggestion window
        - `^-y` to select the suggested text

Current path:
    - Insert mode:
        - `^-g` prints at the bottom the path of the current file


Open history list:
Vim can show and make you select the previous commands/searched executed,
opening a command-line window
    - Type `q:` for commands, or `q/` for searches; or
    - Type `:` or `/` to start entering a command or search, then press the 'cedit' key (default is `Ctrl-f` :help 'cedit').
    - Note: in this mode you will be in a vim like editor so all the movements
      and keymaps will work in it.
The advantage of the command-line window is that you can use all Vim's editing power, including searching with '/' in normal mode, or using whole-line completion (:help compl-whole-line) in insert mode. After editing a command, you can:

Press Enter to execute the current line (and close the command-line window); or
Press Ctrl-c to edit the command; or Press Ctrl-c twice to close the command-line window (cancel).

Show the value of a setting:

`:set <option>?`

For example to show the value of the `textwidth` just type

```
:set textwidth?
```


# Useful tricks

### Highlight in comments
To highlight groups in comments, like TODOs you have to install for treesitter
`:TSInstall comments`

To list all highlight groups type: `:hi`, for more info `:h highlight`

### How to print log messages and read them

```lua
local log = require "plenary.log":new()
log.level = 'debug'
local random_table = { message = 'This is a debug log' }
log.debug(random_table)
-- Then execute `:messages` and go at the bottom, you will see the logged text
```
