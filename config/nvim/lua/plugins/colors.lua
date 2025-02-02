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
  {
    "cdmill/neomodern.nvim",
    priority = 1000,
    opts = {
      plugin = {
        telescope = "borderless",
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        local dark = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeBorder = dark
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
        hl.TelescopePreviewTitle = dark
        hl.TelescopeResultsTitle = dark
      end,
    },
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    opts = {
      integrations = {
        telescope = {
          enabled = true,
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            TelescopeTitle = { fg = colors.blue },
            TelescopePromptNormal = { bg = colors.mantle },
            TelescopePromptBorder = { fg = colors.mantle, bg = colors.mantle },
            TelescopeResultsNormal = { bg = colors.crust },
            TelescopeResultsBorder = { fg = colors.crust, bg = colors.crust },
            TelescopePreviewNormal = { bg = colors.base },
            TelescopePreviewBorder = { fg = colors.base, bg = colors.base },
          }
        end,
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    opts = {
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
      groups = {
        all = {
          TelescopeTitle = { fg = "sel0" },
          TelescopePromptNormal = { bg = "bg0" },
          TelescopePromptBorder = { fg = "bg0", bg = "bg0" },
          TelescopeResultsNormal = { bg = "bg1" },
          TelescopeResultsBorder = { fg = "bg1", bg = "bg1" },
          TelescopePreviewNormal = { bg = "bg2" },
          TelescopePreviewBorder = { fg = "bg2", bg = "bg2" },
        },
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      dim_inactive_windows = true,
      highlight_groups = {
        TelescopeBorder = { fg = "overlay", bg = "overlay" },
        TelescopeNormal = { fg = "subtle", bg = "overlay" },
        TelescopeSelection = { fg = "text", bg = "highlight_med" },
        TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
        TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

        TelescopeTitle = { fg = "base", bg = "love" },
        TelescopePromptTitle = { fg = "base", bg = "pine" },
        TelescopePreviewTitle = { fg = "base", bg = "iris" },

        TelescopePromptNormal = { fg = "text", bg = "surface" },
        TelescopePromptBorder = { fg = "surface", bg = "surface" },
      },
    },
  },
  { "scottmckendry/cyberdream.nvim", priority = 1000 },
}

-- vim: ts=2 sts=2 sw=2 et
