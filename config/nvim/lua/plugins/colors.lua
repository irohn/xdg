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
    priority = 1000,
    name = "rose-pine",
    opts = {},
  },
  {
    "comfysage/evergarden",
    priority = 1000,
    opts = { theme = { variant = "winter" } },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night",
      dim_inactive = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = { theme = "dragon" },
  },
}

-- vim: ts=2 sts=2 sw=2 et
