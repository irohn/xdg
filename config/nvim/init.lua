-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.inccommand = "split" -- preview substitution
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.virtualedit = "block" -- visual block ignore end of lines
vim.opt.linebreak = true
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }
vim.opt.shortmess:append("c")

-- keymaps
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr><esc>")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>m", "<cmd>messages<cr>")
vim.keymap.set("n", "-", function()
	local ok, oil = pcall(require, "oil")
	if ok then
		oil.open()
	else
		vim.cmd("Ex")
	end
end, { desc = "File Explorer" })
vim.keymap.set("n", "<C-f>", function()
	local ok, conform = pcall(require, "conform")
	if ok then
		conform.format({ lsp_fallback = true })
	else
		vim.lsp.buf.format({ async = true })
	end
end, { desc = "Format" })

-- auto commands
local augroup = function(name)
	return vim.api.nvim_create_augroup("irohn.group" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup("lsp-attach"),
	callback = function(event)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to definition" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buf, desc = "Go to references" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Show hover" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Code action" })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight-on-yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	group = augroup("resize-splits"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- LSP servers
vim.lsp.enable({
	"lua_ls",
	"basedpyright",
	"gopls",
	"nixd",
	"clangd",
})

require("config.lazy")

-- vim: ts=2 sts=2 sw=2 et
