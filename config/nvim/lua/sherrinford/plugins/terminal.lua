local terminals = {}

local function project_root()
  return vim.fs.root(0, { ".git" }) or vim.fn.getcwd()
end

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<leader>tt",
      function()
        local root = project_root()
        if not terminals[root] then
          local Terminal = require("toggleterm.terminal").Terminal
          terminals[root] = Terminal:new({
            dir = root,
            direction = "float",
            hidden = true,
          })
        end
        terminals[root]:toggle()
      end,
      desc = "Toggle project terminal",
    },
  },
  opts = {
    direction = "float",
    close_on_exit = false,
    float_opts = {
      border = "curved",
      width = function()
        return math.floor(vim.o.columns * 0.9)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.85)
      end,
    },
    start_in_insert = true,
  },
}
