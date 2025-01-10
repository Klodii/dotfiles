-- to color the rgb strings, like in a css files
-- e.g.:  color: #69BB79;
return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require 'colorizer'.setup()
  end
}
