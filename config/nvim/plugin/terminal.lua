local augroup = function(name)
	return vim.api.nvim_create_augroup("terminal_" .. name, { clear = true })
end

vim.api.nvim_create_user_command("Term", function()
	local terms = {}
	local term_window_height = math.max(5, math.floor(vim.api.nvim_win_get_height(0) * 0.3))
	local term_wins = {}

	-- Find existing terminal windows
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "terminal" then
			table.insert(term_wins, win)
		end
	end

	-- If terminal windows exist, close them
	if #term_wins > 0 then
		for _, win in ipairs(term_wins) do
			vim.api.nvim_win_close(win, false)
		end
		return
	end

	local open_term_win = function()
		vim.cmd("botright split")
		vim.api.nvim_win_set_height(0, term_window_height)
	end

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buftype == "terminal" then
			table.insert(terms, buf)
		end
	end

	if next(terms) == nil then
		open_term_win()
		vim.cmd("terminal")
		vim.cmd.startinsert()
		vim.bo.buflisted = false
	else
		open_term_win()
		local width = vim.api.nvim_win_get_width(0)
		for i, term in ipairs(terms) do
			if i > 1 then
				vim.cmd("vsplit")
			end
			vim.api.nvim_win_set_buf(0, term)
			vim.bo[term].buflisted = false
		end
		local wins = vim.api.nvim_tabpage_list_wins(0)
		for _, win in ipairs(wins) do
			vim.api.nvim_win_set_width(win, math.floor(width / #terms))
		end
		vim.cmd.startinsert()
	end
end, {})

-- set local options for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup("local_options"),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

-- exit terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- toggle bottom terminal
vim.keymap.set({ "n", "t" }, "<c-x>", "<cmd>Term<cr>")

-- terminal split mappings
vim.keymap.set("t", "<c-w>v", "<c-\\><c-n><c-w>v<cmd>terminal<cr>i")
vim.keymap.set("t", "<c-w>s", "<c-\\><c-n><c-w>s<cmd>terminal<cr>i")

-- vim: ts=2 sts=2 sw=2 et
