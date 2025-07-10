return {
	{
		"irohn/nix.nvim",
		dev = true,
    priority = 1000,
		opts = {
			ensure_installed = {
				-- lua
				"lua-language-server", -- lsp
				"stylua", -- formatter

				-- nix
				"nixd", -- lsp
				"nixfmt-rfc-style", -- formatter

				-- shell
				"bash-language-server", -- lsp
				"shellcheck", -- linter
				"shfmt", -- formatter

				-- python
				"basedpyright", -- lsp
				"ruff", -- linter
				"black", -- formatter

				-- json
				"jq", -- formatter

				-- yaml
				"yamlfmt", -- formatter
				"yaml-language-server", -- lsp

        -- markdown, html, css, js, ts
        "prettier", -- formatter
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
