return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")

			npairs.setup({
				check_ts = true, -- Enable treesitter
				enable_check_bracket_line = true, -- Don't add pairs if it already has a close pair in the same line
				ignored_next_char = "[%w%.]", -- Will not add pairs if the next char is alphanumeric
				fast_wrap = {
					map = "<M-e>", -- Alt+e to fast wrap
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
				-- Auto pair rules
				pairs_map = {
					["("] = ")",
					["["] = "]",
					["{"] = "}",
					['"'] = '"',
					["'"] = "'",
					["`"] = "`",
				},
			})

			-- If you use nvim-cmp, integrate with it
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
