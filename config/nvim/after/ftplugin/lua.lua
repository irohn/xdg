local map = require("config.utils").keymap

map("n", "<leader>w", "<cmd>w | source % <cr>", {
  buffer = true,
  desc = "source current file",
})

map("v", "<leader>w", ":.lua<cr>", {
  buffer = true,
  desc = "run selection",
})

-- vim: ts=2 sts=2 sw=2 et
