return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				ensure_installed = {
					"json",
					"go",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"markdown",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IblIndent", { fg = "#2C5B63" }) -- darker teal for regular indents
				vim.api.nvim_set_hl(0, "IblScope", { fg = "#66B7B7" }) -- brighter teal for scope
			end)
			require("ibl").setup({
				indent = {
					char = "│",
					highlight = "IblIndent",
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					injected_languages = true,
					highlight = "IblScope",
					priority = 500,
					include = {
						node_type = {
							["*"] = {
								"arguments",
								"block",
								"class",
								"function",
								"if_statement",
								"table",
								"while",
							},
						},
					},
				},
				exclude = {
					filetypes = {
						"help",
						"dashboard",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
					},
					buftypes = {
						"terminal",
						"nofile",
						"quickfix",
						"prompt",
					},
				},
			})
		end,
	},
}
