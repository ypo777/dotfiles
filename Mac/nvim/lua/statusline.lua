local function apple()
  return [[]]
end
local function file()
  return [[ﴜ]]
end
local statusline = require('lualine')
statusline.setup{
  options = {
    icons_enabled = 1,
    theme = 'onedark',
    component_separators = {'▋',''},
    section_separators = ''
  },
  sections = {
    lualine_a = { apple , 'mode'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {},
    lualine_z = {file,'progress'}
  },
  extensions = {'nvim-tree'}
}
