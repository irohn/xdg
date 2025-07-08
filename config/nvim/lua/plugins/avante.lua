return {
	{
		"yetone/avante.nvim",
		build = "make",
		event = "VeryLazy",
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"zbirenbaum/copilot.lua",
			{
				"OXY2DEV/markview.nvim",
				lazy = false,
				opts = {
					experimental = { check_rtp_message = false },
					preview = {
						filetypes = { "markdown", "avante" },
						ignore_buftypes = {},
					},
				},
			},
		},
		---@module "avante"
		---@type avante.Config
		opts = {
			provider = "copilot",
			providers = {
				copilot = {
					endpoint = "https://api.githubcopilot.com",
					proxy = nil,
					allow_insecure = false,
					timeout = 10 * 60 * 1000,
					max_completion_tokens = 1000000,
					reasoning_effort = "high",
					model = "claude-sonnet-4",
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 20480,
					},
				},
			},
			windows = {
				width = 40,
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
