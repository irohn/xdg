if vim.g.neovide then
  -- neovide options
  vim.g.neovide_refresh_rate = 120

  -- neovide keymaps
  vim.keymap.set("n", "<F11", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end, {})

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
