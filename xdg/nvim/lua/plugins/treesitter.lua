local ts_config = function()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "tmux", "dockerfile", },
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<enter>",
        node_incremental = "<enter>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  })

require('nvim-ts-autotag').setup()
end

local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = ts_config,
  },
}

return M
