return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local statusline = require('lualine')
    statusline.setup {
      options = {
        theme = 'auto',
        component_separators = '',
        section_separators = { left = ' ', right = ' ' },
      },
      sections = {
        lualine_a = { { 'mode' } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
          '%=', --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location' },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
    }
  end
}
