vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>")

vim.keymap.set("n", "<s-h>", "<cmd>bprev<cr>")
vim.keymap.set("n", "<s-l>", "<cmd>bnext<cr>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "-", "<cmd>Explore<cr>")

vim.keymap.set({ "n", "v" }, "<s-y>", '"+y')
vim.keymap.set({ "n", "v" }, "<s-p>", '"+p')

vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>m", "<cmd>messages<cr>")

vim.keymap.set("n", "<leader>q", "<cmd>copen<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>cprev<cr>")

-- vim: ts=2 sts=2 sw=2 et
