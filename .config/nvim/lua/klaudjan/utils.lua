-- global function to use with lua

P = function(v)
    -- inspect the parameter
    print(vim.inspect(v))
    return v
end
