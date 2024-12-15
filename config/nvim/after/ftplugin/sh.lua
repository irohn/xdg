local map = require("config.utils").keymap

map("n", "<leader>w", "<cmd>w | !$SHELL -c %<cr>", {
  buffer = true,
  desc = "source current file",
})

map("n", "<leader>tr", function()
  vim.cmd.split()
  vim.cmd.term()
  vim.api.nvim_win_set_height(0, 5)
  vim.cmd.startinsert()
end)

-- vim: ts=2 sts=2 sw=2 et
