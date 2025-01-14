return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/" },
				layout_strategy = "horizontal", -- Add this
				layout_config = {
					horizontal = {
						preview_width = 0.55,
						height = 0.8, -- Add height
						width = 0.8, -- Add width
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({
				additional_args = function()
					return { "--hidden" }
				end,
			})
		end, { desc = "Live Grep (including hidden)" })
	end,
}
