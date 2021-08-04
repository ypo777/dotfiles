local icons = require('nvim-web-devicons')

local name = "onedark_higl"
vim.g.nvchad_theme = name
local theme = vim.g.nvchad_theme
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

