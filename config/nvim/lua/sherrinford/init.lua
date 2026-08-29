require('sherrinford.set')
require('sherrinford.remap')
require('sherrinford.lazy')

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("Oil")
    end
  end,
})
