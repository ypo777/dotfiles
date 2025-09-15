return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      
      lint.linters_by_ft = {
        dockerfile = { "hadolint" },
      }
      
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
      
      -- Fix Docker Compose filetype detection
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "docker-compose.yml", "docker-compose.yaml", "compose.yml", "compose.yaml" },
        callback = function()
          vim.bo.filetype = "yaml.docker-compose"
        end,
      })
    end,
  }
}
