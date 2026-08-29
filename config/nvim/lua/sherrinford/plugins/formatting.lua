return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Load right before saving so the autocommand always catches :w
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>mp",
      function()
        require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
      end,
      mode = { "n", "v" },
      desc = "Format file or range",
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      go = { "goimports", "gofmt" },
    },

    -- PREVENT GIT DIFF WARS: Stop Prettier if the project doesn't explicitly use Prettier
    formatters = {
      prettier = {
        require_cwd = true, -- Only format if .prettierrc / prettier.config.js exists in the project root
      },
      prettierd = {
        require_cwd = true, -- Same rule for prettier daemon
      },
    },

    -- FORMAT ON SAVE (Automatic via LSP fallback or CLI formatters)
    format_on_save = function(bufnr)
      -- Disable autoformat on save for files in node_modules or vendor directories
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("/node_modules/") or bufname:match("/vendor/") then
        return
      end

      return {
        timeout_ms = 1000,
        lsp_fallback = true, -- AUTOMATIC: Uses installed Mason LSP if no explicit CLI formatter is set!
      }
    end,
  },
}
