if vim.g.neovide then
  -- neovide options
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_input_macos_option_key_is_meta = 'both'
  vim.g.neovide_input_use_logo = 1

  -- neovide keymaps

  vim.keymap.set(
    { 'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't' },
    '<D-v>',
    function() vim.api.nvim_paste(vim.fn.getreg('+'), true, -1) end,
    { noremap = true, silent = true }
  )

  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

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
