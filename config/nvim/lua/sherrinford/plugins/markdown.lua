return {
  -- 1. Browser-based Live Preview (<leader>mp)
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    -- FIX: Run the install script directly via build string instead of calling an uninitialized function
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<CR>",
        desc = "Toggle Markdown Preview (Browser)",
        ft = "markdown",
      },
    },
    config = function()
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
    end,
  },

  -- 2. In-Terminal Rich Render Switch (<leader>mt)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown" },
    },
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>mt",
        "<cmd>RenderMarkdown toggle<CR>",
        desc = "Toggle In-Buffer Markdown Render",
        ft = "markdown",
      },
    },
  },
}
