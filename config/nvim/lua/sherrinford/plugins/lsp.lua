return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "gopls", "vtsls", "eslint", "terraformls" },
        handlers = {
          function(server_name)
            local server_configs = {
              vtsls = {
                filetypes = {
                  "javascript",
                  "javascriptreact",
                  "javascript.jsx",
                  "typescript",
                  "typescriptreact",
                  "typescript.tsx",
                },
                settings = {
                  complete_function_calls = true,
                  vtsls = {
                    enableMoveToFileCodeAction = true,
                    autoUseWorkspaceTsdk = true,
                    experimental = {
                      completion = {
                        enableServerSideFuzzyMatch = true,
                      },
                    },
                  },
                  typescript = {
                    updateImportsOnFileMove = { enabled = "always" },
                    suggest = {
                      completeFunctionCalls = true,
                      autoImports = true,
                      includeCompletionsForModuleExports = true
                    },
                    perferences = {
                      includePackageJsonAutoImports = "on",
                      allowIncompleteCompletions = true,
                    },
                    inlayHints = {
                      enumMemberValues = { enabled = true },
                      functionLikeReturnTypes = { enabled = true },
                      parameterNames = { enabled = "literals" },
                      parameterTypes = { enabled = true },
                      propertyDeclarationTypes = { enabled = true },
                      variableTypes = { enabled = false },
                    },
                  },
                },
              },
              eslint = {
                settings = {
                  codeAction = {
                    disableRuleComment = {
                      enable = true,
                      location = "separateLine",
                    },
                    showDocumentation = {
                      enable = true,
                    },
                  },
                  codeActionOnSave = {
                    enable = false,
                    mode = "all",
                  },
                  experimental = {
                    useFlatConfig = false,
                  },
                  format = true,
                  nodePath = "",
                  onIgnoredFiles = "off",
                  packageManager = "npm",
                  problems = {
                    shortenToSingleLine = false,
                  },
                  quiet = false,
                  rulesCustomizations = {},
                  run = "onType",
                  useESLintClass = false,
                  validate = "on",
                  workingDirectory = { mode = "location" },
                },
              },
              lua_ls = {
                settings = {
                  Lua = {
                    runtime = {
                      version = "LuaJIT",
                    },
                    diagnostics = {
                      globals = { "vim" },
                    },
                    workspace = {
                      library = vim.api.nvim_get_runtime_file("", true),
                      checkThirdParty = false,
                    },
                    telemetry = {
                      enable = false,
                    },
                  },
                },
              },

            }
            local config = server_configs[server_name] or
                { capabilities = require('blink.cmp').get_lsp_capabilities(server_configs.capabilities) }
            require("lspconfig")[server_name].setup(config)
          end,
        },
      })
    end,
  },
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependenices = {
      { "williamboman/mason-lspconfig.nvim" },
      { 'saghen/blink.cmp' }
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      end)

      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      vim.opt.expandtab = true   -- Use spaces instead of tabs
      vim.opt.shiftwidth = 2     -- Number of spaces for indentation
      vim.opt.tabstop = 2        -- Number of spaces that a tab counts for
      vim.opt.softtabstop = 2    -- Number of spaces for tab in insert mode
      vim.opt.smartindent = true -- Smart indentation
      vim.opt.autoindent = true  -- Copy indent from current line
      vim.opt.cindent = true     -- C-style indenting

      -- Better cursor positioning
      vim.opt.scrolloff = 8     -- Keep 8 lines above/below cursor
      vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

      local format = require("conform")
      format.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { { "prettierd", "prettier" } },
        },
        formatters = {
          prettierd = {
            prepend_args = {
              "--bracket-spacing = false"
            },
          },
          prettier = {
            prepend_args = {
              "--bracket-spacing = false"
            },
          },
          shfmt = {
            prepend_args = { "-i", "2", "-ci" }, -- 2 spaces, indent case statements
          },
          gofumpt = {
            prepend_args = { "-extra" }, -- Enable extra formatting rules
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  }
}
