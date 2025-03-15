return {
  {
    "irohn/colorcache.nvim",
    lazy = false,
    opts = {},
    keys = {
      { "<leader>th", "<cmd>Colorcache<cr>", desc = "set colorscheme" },
    },
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  }
}

-- vim: ts=2 sts=2 sw=2 et
