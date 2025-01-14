return {
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- Ensures it loads early
		config = function()
			require("onedark").setup({
				style = "dark",

				colors = {
					-- Your specific background color
					bg0 = "#1b1c1e", -- RGB(27,28,30)
					bg1 = "#1f2022", -- Slightly lighter for contrast
					bg2 = "#252628", -- For floating windows
					bg3 = "#2a2b2d", -- For highlights

					-- Rest of the colors
					fg = "#abb2bf", -- Foreground text
					bright_orange = "#ff9e64", -- Functions
					yellow = "#e5c07b", -- Variables
					red = "#e86671", -- Keywords
					green = "#98c379", -- Strings
					purple = "#c678dd", -- Constants
					blue = "#61afef", -- Tags
					cyan = "#56b6c2", -- Special
				},

				-- Customization options
				transparent = false,
				term_colors = true,
				code_style = {
					comments = "italic",
					functions = "bold",
					keywords = "none",
					strings = "none",
					variables = "none",
				},
			})

			-- Load the colorscheme
			vim.cmd.colorscheme("onedark")
		end,
	},
}
