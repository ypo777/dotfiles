return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_tool_installer = require("mason-tool-installer")
      
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      
      mason_tool_installer.setup({
        ensure_installed = {
          -- Formatters
          "prettier", -- prettier formatter
          "prettierd", -- faster prettier
          "stylua", -- lua formatter
          
          -- Linters
          "hadolint", -- Dockerfile linter
        },
      })
    end,
  },
  
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "gopls", "vtsls", "eslint", "terraformls", "dockerls", "docker_compose_language_service" },
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
                    preferences = {
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
              dockerls = {
                -- Docker language server for Dockerfile support
                filetypes = { "dockerfile" },
                settings = {},
              },
              docker_compose_language_service = {
                -- Docker Compose language server
                filetypes = { "yaml.docker-compose" },
                settings = {},
              },
              eslint = {
                -- Let ESLint use project configuration
                -- Will respect eslint.config.js, .eslintrc.js, etc.
                settings = {
                  validate = "on",
                  format = false,  -- Let conform handle formatting
                  workingDirectory = { mode = "auto" },
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
            
            local config = server_configs[server_name] or {}
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            
            -- Disable formatting for vtsls and eslint (let conform handle it)
            if server_name == "vtsls" or server_name == "eslint" then
              config.on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
              end
            end
            
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
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
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

        -- Manual formatting with conform
        vim.keymap.set("n", "<leader>f", function()
          require("conform").format({ 
            lsp_fallback = true, 
            async = false, 
            timeout_ms = 1000 
          })
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
}
