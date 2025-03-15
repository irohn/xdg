return {
  "stevearc/oil.nvim",
  dependencies = {
    { "echasnovski/mini.icons", opts = {} }
  },
  ---@module "oil"
  ---@type oil.SetupOpts
  ---@diagnostic disable-next-line: assign-type-mismatch
  config = function()
    local detail = false
    require("oil").setup({
      win_options = {
        signcolumn = "yes:3",
        number = false,
        relativenumber = false,
      },
      keymaps = {
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    })

    local function change_command(cmd, callback, opts)
      local options = { nargs = "?", complete = "dir" }
      if opts then
        options = vim.tbl_extent("force", options, opts)
      end
      vim.api.nvim_create_user_command(cmd, callback, options)
    end

    change_command("Explore", function()
      vim.cmd("Oil")
    end)
    change_command("Ex", function()
      vim.cmd("Oil")
    end)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
