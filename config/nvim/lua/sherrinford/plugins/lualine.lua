return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lualine = require("lualine")

		-- Custom component for LSP status
		local lsp_status_cache = {
			status = "",
			last_update = 0,
		}

		local function lsp_status()
			local current_time = vim.loop.now()
			-- Update cache every 5000ms (5 seconds)
			if current_time - lsp_status_cache.last_update > 5000 then
				local clients = vim.lsp.get_active_clients()
				if #clients > 0 then
					local names = {}
					for _, client in ipairs(clients) do
						local name = client.name
						name = name:gsub("typescript%-language%-server", "ts")
							:gsub("lua%-language%-server", "lua")
							:gsub("pyright", "py")
							:gsub("gopls", "go")
							:gsub("rust_analyzer", "rs")
						table.insert(names, name)
					end
					lsp_status_cache.status = " " .. table.concat(names, " ")
				else
					lsp_status_cache.status = "  No LSP"
				end
				lsp_status_cache.last_update = current_time
			end
			return lsp_status_cache.status
		end
		lualine.setup({
			options = {
				theme = "onedark",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				-- Left side
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							-- Shorten mode names
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = {
					{
						"location",
						fmt = function(str)
							-- Show current line/total lines
							return vim.fn.line(".") .. "/" .. vim.fn.line("$")
						end,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1, -- Show relative path
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
					},
				},
				-- Right side
				lualine_x = {
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_y = {
					{
						lsp_status,
						color = { fg = "#98C379" },
					},
					{
						"branch",
						icon = "",
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "fugitive", "nvim-tree" },
		})
	end,
}
