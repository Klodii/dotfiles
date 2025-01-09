local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values


local M = {}

M.live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      -- % is the escape character in lua
      local pieces = vim.split(prompt, " %-g ")

      local log = require "plenary.log":new()
      log.level = 'debug'
      log.debug(pieces)
      -- Then execute `:messages` and go at the bottom, you will see the logged text

      local args = { "rg" } -- ripgrep
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      }
    end,
    -- entry_maker tels how to display in the list and which data, of the selected item, to use for the preview
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "RipGrep (` -g ` if you want to glob file names)",
    finder = finder,                               -- function that finds the entry to display
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(), -- don't sort because rg will sort it
  }):find()
end

return M