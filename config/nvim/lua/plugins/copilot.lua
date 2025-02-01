return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = false,
        debounce = 75,
        keymap = {
          accept = "<s-tab>",
          next = "<C-l>",
          prev = "<C-h>",
          dismiss = "<C-c>",
        },
      },
    },
  },
}
