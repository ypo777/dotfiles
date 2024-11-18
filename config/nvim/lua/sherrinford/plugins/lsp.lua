return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				-- Automatically install these LSP servers
				ensure_installed = {
					-- Programming Languages
					"lua_ls",
					"gopls",
					"pyright",
					"html",
					"cssls",
					"bashls",

					-- Infrastructure and Configuration
					"yamlls", -- YAML
					"dockerls", -- Dockerfile
					"docker_compose_language_service",
					"terraformls", -- Terraform
					"ansiblels", -- Ansible
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			local lspconfig = require("lspconfig")
			local capabilites = require("cmp_nvim_lsp").default_capabilities()

			-- Global mappings
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
			})

			vim.diagnostic.config({
				float = {
					border = "rounded",
					source = "always",
				},
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				-- Simple tab completion
				mapping = {
					-- Navigate the dropdown with Tab
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					-- Navigate backwards with Shift+Tab
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					-- Accept currently selected item with Enter
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					-- Close completion window with Escape
					["<Esc>"] = cmp.mapping.close(),
				},

				-- Sources in priority order
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Format with Alt-Shift-F, like VSCode
				"<A-S-f>",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		config = function()
			require("conform").setup({
				-- Format on save
				format_on_save = {
					-- I recommend these settings
					lsp_fallback = true,
					timeout_ms = 500,
				},

				-- Simple formatter setup
				formatters_by_ft = {
					-- Web development
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },

					-- Backend languages
					python = { "black" },
					go = { "gofmt" },
					lua = { "stylua" },
					rust = { "rustfmt" },

					-- Shell
					sh = { "shfmt" },

					-- Infrastructure
					dockerfile = { "dockerfile_format" },
					terraform = { "terraform_fmt" },
				},

				-- Let's add some pretty notifications
				notify_on_error = true,
			})

			-- Add format command
			vim.api.nvim_create_user_command("Format", function()
				require("conform").format({ async = true })
			end, { desc = "Format buffer" })
		end,
	},
}
