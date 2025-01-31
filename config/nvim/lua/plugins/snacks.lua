return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      input = { enabled = true },
      quickfile = { enabled = true },
      words = { enabled = true },
      styles = {
        scratch = {
          minimal = true,
          border = "none",
        },
      },
    },
    keys = {
      { "<leader>s",  function() Snacks.scratch() end,   desc = "Toggle Scratch Buffer" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse",           mode = { "n", "v" } },
      { "<c-x>",      function() Snacks.terminal() end,  desc = "Toggle Terminal",      mode = { "n", "t" } },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.indent():map("<leader>ui")
        end,
      })
    end,
  }
}
