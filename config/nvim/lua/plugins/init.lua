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
			require("mini.align").setup()
			require("mini.icons").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
