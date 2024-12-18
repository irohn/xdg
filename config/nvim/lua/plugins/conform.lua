return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<c-f>",
			function()
				require("conform").format({ async = true, lsp_fallback = true }, function(err)
					if err then
						vim.notify("Format failed", vim.log.levels.WARN)
					else
						vim.notify("Format success", vim.log.levels.INFO, { timeout = 500 })
					end
				end)
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			nix = { "nixfmt" },
			python = { "isort", "black" },
			sh = { "shfmt" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

-- vim: ts=2 sts=2 sw=2 et
