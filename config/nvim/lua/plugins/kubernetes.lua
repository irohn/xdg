return {
  {
    "ramilito/kubectl.nvim",
    config = function()
      ---@diagnostic disable-next-line: missing-parameter
      require("kubectl").setup()
      vim.keymap.set(
        "n",
        "<leader>k",
        '<cmd>lua require("kubectl").toggle()<cr>',
        { noremap = true, silent = true }
      )
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
