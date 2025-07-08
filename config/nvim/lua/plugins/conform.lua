return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "ruff" },
				sh = { "shfmt" },
				json = { "jq" },
				yaml = { "yamlfmt" },
				markdown = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
