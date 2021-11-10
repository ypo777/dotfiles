local M = {}
local cmd = vim.cmd
M.colorizer = function()
    local clizer = require('colorizer')
    clizer.setup()
    cmd[["ColorizerReloadAllBuffers"]]

end

M.signature = function()
  local l_saga = require 'lspsaga'
  l_saga.init_lsp_saga()
end

return M
