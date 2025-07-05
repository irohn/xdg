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
vim.keymap.set("n", ">", ">gv")
vim.keymap.set("n", "<", "<gv")
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
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)

-- auto commands
local augroup = function(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

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

require("config.lazy")

-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition({}) end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<Leader>ih", function()
      -- toggles inlay hints
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, opts)
    vim.keymap.set("n", "<Leader>di", vim.diagnostic.open_float, opts)

    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/implementation') then
      vim.keymap.set("n", "gD", function() vim.lsp.buf.implementation({}) end, opts)
    end

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

require("config.servers")

-- vim: ts=2 sts=2 sw=2 et
