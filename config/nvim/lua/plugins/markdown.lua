return {
  "brianhuster/live-preview.nvim",

  {
    "irohn/focus.nvim",
    lazy = true,
    opts = {
      on_enter = function()
        if vim.fn.executable("tmux") == 1 then
          vim.fn.system("tmux set status off")
        end
      end,
      on_exit = function()
        if vim.fn.executable("tmux") == 1 then
          vim.fn.system("tmux set status on")
        end
      end,
    },
    cmd = { "Focus", "FocusOn", "FocusOff" },
    keys = {{ "<leader>z", "<cmd>Focus<cr>", desc = "Toggle focus (zen) mode" }},
  },
}
