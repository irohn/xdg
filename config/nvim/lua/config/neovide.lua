if vim.g.neovide then
  -- neovide options
  vim.g.neovide_refresh_rate = 120

  -- neovide keymaps

  local mappings = {
    ["<S-Esc>"] = function()
      vim.cmd("stopinsert")
    end,
  }

  for key, func in pairs(mappings) do
    vim.keymap.set("t", key, func, { noremap = true, silent = true })
  end

  -- options
  vim.o.laststatus = 0
  vim.o.cmdheight = 0

  -- terminal options
  vim.opt.termguicolors = true

  vim.cmd("terminal")
  vim.cmd("startinsert")
  vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "term://*",
    command = "quit"
  })
end
