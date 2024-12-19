-- clear hightlights
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>")

-- indent while remaining in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- copy/paste to/from clipboard
vim.keymap.set({ "n", "v" }, "<s-y>", '"*y')
vim.keymap.set({ "n", "v" }, "<s-p>", '"*p')

-- move between buffers
vim.keymap.set("n", "<s-h>", "<cmd>bprev<cr>")
vim.keymap.set("n", "<s-l>", "<cmd>bnext<cr>")

-- quickfix list navigation
vim.keymap.set("n", "<leader>q", "<cmd>copen<cr>")
vim.scheduile(function()
	vim.keymap.set("n", "<c-j>", "<cmd>cnext<cr>")
	vim.keymap.set("n", "<c-k>", "<cmd>cprev<cr>")
end)

-- open file explorer
vim.keymap.set("n", "-", "<cmd>Explore<cr>")

-- keeping the cursor centered
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- show messages
vim.keymap.set("n", "<leader>m", "<cmd>messages<cr>")

-- vim: ts=2 sts=2 sw=2 et
