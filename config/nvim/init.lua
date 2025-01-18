-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.autocmds")
require("config.options")
require("config.lazy")
require("config.keymaps")

-- vim: ts=2 sts=2 sw=2 et
