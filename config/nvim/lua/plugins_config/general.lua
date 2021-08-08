local M = {}
local cmd = vim.cmd
M.colorizer = function()
    local clizer = require('colorizer')
    clizer.setup()
    cmd[["ColorizerReloadAllBuffers"]]

end

return M
