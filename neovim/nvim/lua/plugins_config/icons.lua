local icons = require('nvim-web-devicons')

local theme = "themes/" .. vim.g.theme
local colors = require(theme)

icons.setup {
  override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 default = true;
}

