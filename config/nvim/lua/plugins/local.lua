return {
	{
		"irohn/nix.nvim",
		dev = true,
		opts = {
			ensure_installed = {
				-- lua
				"lua-language-server",
				"stylua",

				-- nix
				"nixd",
				"nixfmt-rfc-style",

        -- shell
        "bash-language-server",
        "shellcheck",
        "shfmt",

        -- python
        "basedpyright",
        "ruff",
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et
