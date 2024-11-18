return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = false,
					hidden = true,
					respect_gitignore = false,
					grouped = true,
					mappings = {
						["i"] = {
							["<C-c>"] = fb_actions.create,
							["<C-d>"] = fb_actions.remove,
							["<C-r>"] = fb_actions.rename,
							["<C-y>"] = fb_actions.copy,
							["<C-m>"] = fb_actions.move,
							["<C-h>"] = fb_actions.goto_parent_dir,
						},
						["n"] = {
							["c"] = fb_actions.create,
							["d"] = fb_actions.remove,
							["r"] = fb_actions.rename,
							["y"] = fb_actions.copy,
							["m"] = fb_actions.move,
							["h"] = fb_actions.goto_parent_dir,
							["l"] = actions.select_default,
							["H"] = fb_actions.toggle_hidden,
						},
					},
				},
			},
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/" },
				layout_config = {
					horizontal = {
						preview_width = 0.55,
					},
				},
			},
		})

		telescope.load_extension("file_browser")

		-- File search with full capabilities
		vim.keymap.set("n", "<leader>ff", function()
			telescope.extensions.file_browser.file_browser({
				files = true,
				depth = false,
				hidden = true,
				respect_gitignore = false,
				previewer = true,
				initial_mode = "normal",
				grouped = true,
				select_buffer = true,
			})
		end, { desc = "Find Files (with actions)" })

		-- Directory-focused search
		vim.keymap.set("n", "<leader>fd", function()
			telescope.extensions.file_browser.file_browser({
				files = false,
				depth = false,
				hidden = true,
				respect_gitignore = false,
				previewer = true,
				initial_mode = "normal",
				grouped = true,
				select_buffer = true,
			})
		end, { desc = "Find Directories (with actions)" })

		-- Text search
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
	end,
}
