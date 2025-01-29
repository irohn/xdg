return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },

  {
    "irohn/colorcache.nvim",
    lazy = false,
    keys = {
      { "<leader>th", "<cmd>Colorcache<cr>", desc = "set colorscheme" },
    },
    opts = {},
  },

  {
    "mikesmithgh/borderline.nvim",
    enabled = true,
    lazy = true,
    event = 'VeryLazy',
    config = function()
      require("borderline").setup({})
    end,
  },

  -- colorschemes
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      overrides = function(colors)
        local theme = colors.theme
        return {
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
      end,
    },
  },
  { "scottmckendry/cyberdream.nvim", priority = 1000 },
  { "EdenEast/nightfox.nvim",        priority = 1000 },
  { "folke/tokyonight.nvim",         priority = 1000 },
  { "navarasu/onedark.nvim",         priority = 1000 },
  { "Mofiqul/vscode.nvim",           priority = 1000 },
  { "tiagovla/tokyodark.nvim",       priority = 1000 },
  { "comfysage/evergarden",          priority = 1000 },
  { "rose-pine/neovim",              priority = 1000, name = "rose-pine" },
  { "catppuccin/nvim",               priority = 1000, name = "catppuccin" },
}

-- vim: ts=2 sts=2 sw=2 et
