return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local treesitter = require('nvim-treesitter.configs')

      treesitter.setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        ensure_installed = {
          'json',
          'javascript',
          'typescript',
          'tsx',
          'yaml',
          'html',
          'css',
          'markdown',
          'go',
          'gomod',
          'gowork',
          'gosum',
          'bash',
          'lua',
          'vim',
          'dockerfile',
          'gitignore',
        },
      })
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      -- Create cyan-only highlight groups that work with Carbonfox
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- Cyan variations - from subtle to more visible
        vim.api.nvim_set_hl(0, "CyanIndent1", { fg = "#2a3441" }) -- Very subtle
        vim.api.nvim_set_hl(0, "CyanIndent2", { fg = "#3c4c5c" }) -- Slightly more visible
        vim.api.nvim_set_hl(0, "CyanIndent3", { fg = "#4e6578" }) -- Medium
        vim.api.nvim_set_hl(0, "CyanIndent4", { fg = "#6b8394" }) -- More prominent
        vim.api.nvim_set_hl(0, "CyanScope", { fg = "#7fd5ea", bold = true })
      end)

      require("ibl").setup {
        indent = {
          highlight = { "CyanIndent1", "CyanIndent2", "CyanIndent3", "CyanIndent4" },
          char = "▏",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
          highlight = "CyanScope",
          char = "▎",
        },
      }
    end,
  }
}
