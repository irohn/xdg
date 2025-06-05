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
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
  },

}

-- vim: ts=2 sts=2 sw=2 et
