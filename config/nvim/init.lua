-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("autocmds")
require("options")
require("config.lazy")
require("keymaps")

-- vim: ts=2 sts=2 sw=2 et
