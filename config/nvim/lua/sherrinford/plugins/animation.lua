return {
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		config = function()
			local animate = require("mini.animate")
			animate.setup({
				-- Cursor path
				cursor = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
					path = animate.gen_path.line(),
				},
				-- Scroll
				scroll = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({ max_output_steps = 20 }),
				},
				resize = {
					enable = true,
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
			})
		end,
	},
	{
		"rainbowhxch/accelerated-jk.nvim",
		config = function()
			require("accelerated-jk").setup({
				mode = "time_driven",
				enable_deceleration = false,
				acceleration_motions = { "j", "k" },
				acceleration_limit = 150,
				acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
				deceleration_table = { { 150, 9999 } },
			})

			-- Accelerated j/k movements
			vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
			vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})
		end,
	},
}
