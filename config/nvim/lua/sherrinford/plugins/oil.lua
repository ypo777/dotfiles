return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory in Oil" },
    { "<leader>pv", "<cmd>Oil<cr>", desc = "Open current file directory in Oil" },
  },
}
