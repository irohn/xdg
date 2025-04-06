return {
  "irohn/opinionated.nvim",
  lazy = false,
  dependencies = {
    "tpope/vim-sleuth"
  },
  opts = {
    options = {
      relativenumber = true,
      cursorline = true,
      laststatus = 3,
      wrap = false,
      signcolumn = "yes",
      clipboard = "unnamedplus",
    },
  },
  keys = {
    { "-", "<cmd>Explore<cr>", desc = "open file explorer" },
    { "<s-h>", "<cmd>bprev<cr>", desc = "previous buffer" },
    { "<s-l>", "<cmd>bnext<cr>", desc = "next buffer" },
    { "<s-z><s-q>", "<cmd>bdelete<cr>", desc = "delete buffer without quitting" },
  },
}

-- vim: ts=2 sts=2 sw=2 et
