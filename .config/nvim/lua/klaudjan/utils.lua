-- global function to use with lua

P = function(v)
    -- inspect the parameter
    print(vim.inspect(v))
    return v
end

function get_scratch()
    -- create a scratch buffer in a new tab

    vim.api.nvim_command('tabnew')
    --[[
    [Parameters:
    [{listed} Sets 'buflisted'
    [{scratch} Creates a "throwaway" scratch-buffer for temporary work (always
    ['nomodified'). Also sets 'nomodeline' on the buffer.
    ]]
    vim.api.nvim_create_buf(false, true)

    -- set some local option for this buffer, only to make it a scratch one
    -- will tell vim that this newly-created buffer should be considered nofile type, so a scratch buffer
    vim.opt_local.buftype = 'nofile'
    vim.opt_local.bufhidden = 'hide'
    -- do not create a swap file
    vim.opt_local.swapfile = false
end

-- the return table is used to permit the retrive of the functions with
-- :lua require("klaudjan.utils").function_name()
return {
    get_scratch = get_scratch
}
