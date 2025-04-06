return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    explorer = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
  },
  keys = {
    -- files
    { "<leader>fb", function() Snacks.picker.buffers() end,            desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end,              desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end,             desc = "Recent" },
    { "<leader>fg", function() Snacks.picker.grep() end,               desc = "Grep" },
    { "<leader>fp", function() Snacks.picker.projects() end,           desc = "Projects" },

    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end,       desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end,            desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,       desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end,         desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end,          desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,           desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,       desc = "Git Log File" },

    -- search
    { "<leader>sh", function() Snacks.picker.help() end,               desc = "Help Pages" },
    { '<leader>s"', function() Snacks.picker.registers() end,          desc = "Registers" },
    { "<leader>sc", function() Snacks.picker.commands() end,           desc = "Commands" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,        desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sj", function() Snacks.picker.jumps() end,              desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,            desc = "Keymaps" },
    { "<leader>sm", function() Snacks.picker.marks() end,              desc = "Marks" },
    { "<leader>sM", function() Snacks.picker.man() end,                desc = "Man Pages" },
    { "<leader>sq", function() Snacks.picker.qflist() end,             desc = "Quickfix List" },
    { "<leader>su", function() Snacks.picker.undo() end,               desc = "Undo History" },

    -- misc
    { "<leader>e",  function() Snacks.explorer() end,                  desc = "File Explorer" },
    { "<leader>:",  function() Snacks.picker.command_history() end,    desc = "Command History" },
    { "<leader>/",  function() Snacks.picker.lines() end,              desc = "Buffer Lines" },
    { "<c-x>",      function() Snacks.terminal() end,                  mode = { "n", "t", "v", "i" }, desc = "Toggle Terminal" },
  }
}

-- vim: ts=2 sts=2 sw=2 et
