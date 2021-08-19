local main_theme = "onedark"
local present, base16 = pcall(require, "base16")

vim.g.theme = main_theme

if present then
  base16(base16.themes(main_theme), true)
  require 'plugins_config.highlights'
  return true
else
  return false
end

