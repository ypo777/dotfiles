return {
	-- 1. On-Demand LSP Installer
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall" },
		opts = {},
	},

	-- 2. Native LSP Setup & Keymaps
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Automatically hook up keymaps whenever an LSP connects
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }
					local t = require("telescope.builtin")

					-- VS Code-style Navigation (with Telescope Preview Panes)
					vim.keymap.set("n", "gd", t.lsp_definitions, opts) -- Go to definition
					vim.keymap.set("n", "gr", t.lsp_references, opts) -- Show all calls/references
					vim.keymap.set("n", "gi", t.lsp_implementations, opts) -- Go to interface impl
					vim.keymap.set("n", "<leader>ds", t.lsp_document_symbols, opts) -- Struct/Method outline

					-- Standard Actions
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Hover docs
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename variable
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
				end,
			})
		end,
	},
}
