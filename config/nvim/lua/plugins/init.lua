return {
	-- Git integration
	"tpope/vim-fugitive",

	-- Auto indent detection
	"tpope/vim-sleuth",

	-- mini.nvim collection
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			-- text alignment plugin
			require("mini.align").setup()
			-- icon provider (requires patched font)
			require("mini.icons").setup()
			-- auto pair common characters
			require("mini.pairs").setup()
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
