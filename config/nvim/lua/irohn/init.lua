-- set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- configure lazy
require("irohn.lazy")

require("irohn.autocmds")
require("irohn.keymaps")
require("irohn.options")
require("irohn.terminal")
require("irohn.theme")
