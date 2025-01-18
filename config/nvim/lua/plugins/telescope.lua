return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("telescope").setup({
      -- workaround to set all pickers theme
      -- https://github.com/nvim-telescope/telescope.nvim/issues/938#issuecomment-877539724
      defaults = require("telescope.themes").get_ivy({
        theme = "ivy",
      }),
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = { "^.git/" }
        }
      }
    })
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")
    local set = vim.keymap.set

    set("n", "<leader>ff", builtin.find_files, {})
    set("n", "<leader>fd", function()
      builtin.find_files({ cwd = utils.buffer_dir() })
    end, {})
    set("n", "<leader>fg", builtin.live_grep, {})
    set("n", "<leader>fh", builtin.help_tags, {})

    set("n", "<leader>fb", function()
      builtin.buffers({
        sort_mru = true,
        initial_mode = "normal",
      })
    end, {})

    set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 4,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily find in current buffer" })

    set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
    set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
    set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })

    set("n", "<leader>j", function()
      builtin.jumplist({ initial_mode = "normal" })
    end, { desc = "Jumplist" })

    set("n", "<leader>fn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "find files in neovim config path" })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
