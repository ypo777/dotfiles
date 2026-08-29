return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local statusline = require("lualine")

		statusline.setup({
			options = {
				theme = "sonokai",
				component_separators = "",
				section_separators = { left = " ", right = " " },
			},
			sections = {
				lualine_a = { { "mode" } },
				lualine_b = { "filename", "branch" },
				lualine_c = {
					"%=", --[[ add your center components here in place of this comment ]]
				},
				lualine_x = {
					-- LSP Diagnostics with icons and colors
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "nvim_lsp" },
						sections = { "error", "warn", "info", "hint" },
						diagnostics_color = {
							error = "DiagnosticError", -- Changes diagnostics' error color.
							warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
							info = "DiagnosticInfo", -- Changes diagnostics' info color.
							hint = "DiagnosticHint", -- Changes diagnostics' hint color.
						},
						symbols = {
							error = "✘ ",
							warn = "▲ ",
							info = "» ",
							hint = "⚑ ",
						},
						colored = true, -- Displays diagnostics status in color if set to true.
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
				},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location" },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
