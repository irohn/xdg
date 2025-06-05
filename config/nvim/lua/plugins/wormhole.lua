return {
  {
    "irohn/wormhole.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Wormhole", "Wh" },
    keys = {
      { "<leader>ss", "<cmd>Wormhole ssh<cr>",     desc = "wormhole ssh" },
      { "<leader>se", "<cmd>Wormhole explore<cr>", desc = "wormhole explorer" },
    },
    opts = {},
  },
}
