return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    build = "make",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = false,
        debounce = 75,
        keymap = {
          accept = "<tab>",
          next = "<C-l>",
          prev = "<C-h>",
          dismiss = "<C-c>",
        },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
