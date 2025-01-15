return {
  {
    "echasnovski/mini.base16",
    version = "*",
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },

  {
    "irohn/colorcache.nvim",
    name = "colorcache",
    config = function()
      require("colorcache").setup()
      vim.keymap.set("n", "<leader>th", "<cmd>Colorcache<cr>", { desc = "set colorscheme" })
    end,
  },

  -- colorschemes
  { "rebelot/kanagawa.nvim",   priority = 1000 },
  { "EdenEast/nightfox.nvim",  priority = 1000 },
  { "folke/tokyonight.nvim",   priority = 1000 },
  { "navarasu/onedark.nvim",   priority = 1000 },
  { "shaunsingh/nord.nvim",    priority = 1000 },
  { "Mofiqul/vscode.nvim",     priority = 1000 },
  { "tiagovla/tokyodark.nvim", priority = 1000 },
  { "comfysage/evergarden",    priority = 1000 },
  { "rose-pine/neovim",        priority = 1000, name = "rose-pine" },
  { "catppuccin/nvim",         priority = 1000, name = "catppuccin" },
}

-- vim: ts=2 sts=2 sw=2 et
