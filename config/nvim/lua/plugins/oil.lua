return {
	"stevearc/oil.nvim",
	lazy = false,
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		win_options = {
			signcolumn = "yes:3",
			number = false,
			relativenumber = false,
		},
		keymaps = {
			["gd"] = {
				desc = "Toggle file detail view",
				callback = function()
					local detail
					detail = not detail
					if detail then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
			},
		},
		view_options = {
			show_hidden = true,
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
