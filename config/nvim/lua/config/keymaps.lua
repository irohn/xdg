local set = vim.keymap.set

set("n", "<esc>", "<cmd>nohlsearch<cr><esc>")

set("n", "<s-h>", "<cmd>bprev<cr>")
set("n", "<s-l>", "<cmd>bnext<cr>")

set("v", "<", "<gv")
set("v", ">", ">gv")

set("n", "-", "<cmd>Explore<cr>")

set({ "n", "v" }, "<s-y>", '"+y')
set({ "n", "v" }, "<s-p>", '"+p')

set("n", "<c-d>", "<c-d>zz")
set("n", "<c-u>", "<c-u>zz")

set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<leader>m", "<cmd>messages<cr>")

set("n", "<leader>q", "<cmd>copen<cr>")
set("n", "<c-j>", "<cmd>cnext<cr>")
set("n", "<c-k>", "<cmd>cprev<cr>")

-- vim: ts=2 sts=2 sw=2 et
