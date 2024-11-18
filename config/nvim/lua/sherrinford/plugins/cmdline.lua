return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim", -- Fixed typo in MunifTanjim
		"rcarriga/nvim-notify",
	},
	config = function()
		local noice = require("noice")
		noice.setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				opts = {
					position = {
						row = "50%",
						col = "50%",
					},
					size = {
						width = "40%",
						height = "auto",
					},
					border = {
						style = "rounded",
						padding = { 1, 2 },
					},
				},
				icons = {
					["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
					["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
					[":"] = { icon = " ", hl_group = "DiagnosticInfo" },
				},
			},
			messages = {
				enabled = true,
				view = "notify",
				view_error = "notify",
				view_warn = "notify",
				view_history = "messages",
				view_search = "virtualtext",
			},
			notify = {
				enabled = true,
				view = "notify",
				opts = {
					position = {
						row = 2,
						col = "99%",
					},
					size = {
						width = "auto",
						height = "auto",
					},
					stages = "fade",
					timeout = 3000,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			commands = {
				all = {
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
				{
					filter = {
						cond = function()
							return not vim.g.focused
						end,
					},
					view = "notify_send",
					opts = { stop = false },
				},
				{
					filter = { event = "msg_show", kind = "error" },
					opts = { skip = false, hl_group = "DiagnosticError" },
				},
				{
					filter = { event = "msg_show", kind = "warn" },
					opts = { skip = false, hl_group = "DiagnosticWarn" },
				},
				{
					filter = { event = "msg_show", kind = "info" },
					opts = { skip = false, hl_group = "DiagnosticInfo" },
				},
			},
			format = {
				level = {
					icons = {
						error = " ",
						warn = " ",
						info = " ",
					},
				},
			},
		})

		-- Window focus tracking (moved outside of setup)
		local focused = true
		vim.api.nvim_create_autocmd("FocusGained", {
			callback = function()
				focused = true
				vim.g.focused = true
			end,
		})

		vim.api.nvim_create_autocmd("FocusLost", {
			callback = function()
				focused = false
				vim.g.focused = false
			end,
		})

		-- Markdown keymaps
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function(event)
				vim.schedule(function()
					require("noice.text.markdown").keys(event.buf)
				end)
			end,
		})

		-- Highlights
		vim.cmd([[
            highlight NoiceCmdlinePopup guibg=#1a1b26
            highlight NoiceCmdlineIcon guifg=#7aa2f7
            highlight NoiceConfirmBorder guifg=#7aa2f7
            highlight NoiceCmdlineIconSearch guifg=#e0af68
        ]])

		-- Command height
		vim.o.cmdheight = 0
	end,
}
