return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- STABLE COMMUNITY RELEASE
    build = ":TSUpdate",
    config = function()
      -- Fixes tarball rename errors on macOS by cloning parsers directly via Git
      require("nvim-treesitter.install").prefer_git = true

      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "markdown",
          "go",
          "gomod",
          "gowork",
          "gosum",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
        },
      })

      -- Neovim 0.12 cannot evaluate nvim-treesitter's legacy
      -- #set-lang-from-info-string! directive. Use native injection captures
      -- for fenced Markdown code blocks instead.
      vim.treesitter.query.set("markdown", "injections", [[
        (fenced_code_block
          (info_string
            (language) @injection.language)
          (code_fence_content) @injection.content)

        ((html_block) @injection.content
          (#set! injection.language "html")
          (#set! injection.combined)
          (#set! injection.include-children))

        ((minus_metadata) @injection.content
          (#set! injection.language "yaml")
          (#offset! @injection.content 1 0 -1 0)
          (#set! injection.include-children))

        ((plus_metadata) @injection.content
          (#set! injection.language "toml")
          (#offset! @injection.content 1 0 -1 0)
          (#set! injection.include-children))

        ([
          (inline)
          (pipe_table_cell)
        ] @injection.content
          (#set! injection.language "markdown_inline"))
      ]])
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "CyanIndent1", { fg = "#2a3441" })
        vim.api.nvim_set_hl(0, "CyanIndent2", { fg = "#3c4c5c" })
        vim.api.nvim_set_hl(0, "CyanIndent3", { fg = "#4e6578" })
        vim.api.nvim_set_hl(0, "CyanIndent4", { fg = "#6b8394" })
        vim.api.nvim_set_hl(0, "CyanScope", { fg = "#7fd5ea", bold = true })
      end)

      require("ibl").setup({
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
      })
    end,
  },
}
