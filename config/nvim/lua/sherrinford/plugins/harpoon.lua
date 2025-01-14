return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim", -- Optional, for telescope integration
	},
	config = function()
		local harpoon = require("harpoon")

		-- Harpoon setup with extended configuration
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				save_on_change = true,
				enter_on_sendcmd = false,
				tmux_autoclose_windows = false,
				excluded_filetypes = { "harpoon", "TelescopePrompt", "NvimTree", "neo-tree" },
				mark_branch = false, -- Set to true if you want marks specific to each git branch
			},
			-- Menu configuration
			menu = {
				width = vim.api.nvim_win_get_width(0) - 40,
			},
		})

		-- Basic marks and menu
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Harpoon Add File" })
		vim.keymap.set("n", "<leader>hm", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Menu" })

		-- Quick file navigation (using number row for first 4 files)
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon File 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon File 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon File 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon File 4" })

		-- Navigation between marks
		vim.keymap.set("n", "<C-p>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon Prev File" })
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():next()
		end, { desc = "Harpoon Next File" })

		-- List manipulation
		vim.keymap.set("n", "<leader>hr", function()
			harpoon:list():remove()
		end, { desc = "Harpoon Remove File" })
		vim.keymap.set("n", "<leader>hc", function()
			harpoon:list():clear()
		end, { desc = "Harpoon Clear All" })

		-- Optional: Telescope integration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>hf", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Harpoon Find File" })
	end,
}
