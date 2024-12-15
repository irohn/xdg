local map = require("config.utils").keymap
local augroup = require("config.utils").augroup
local toggle_terminal = require("config.utils").toggle_terminal

vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("term_open"),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})
-- exit terminal mode
map("t", "<esc><esc>", "<c-\\><c-n>")

-- toggle bottom terminal
map({"n", "t"}, "<C-x>", function()
  toggle_terminal()
end)

-- vim: ts=2 sts=2 sw=2 et
