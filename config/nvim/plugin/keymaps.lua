local keymaps = {
	["<esc>"] = "<cmd>nohlsearch<cr><esc>",
	["s-h"] = "<cmd>bprev<cr>",
	["s-l"] = "<cmd>bnext<cr>",
	["<"] = { rhs = "<gv", modes = "v" },
	[">"] = { rhs = ">gv", modes = "v" },
	["-"] = "<cmd>Explore<cr>",
	["<c-d>"] = "<c-d>zz",
	["<c-u>"] = "<c-u>zz",
	["n"] = "nzzzv",
	["N"] = "Nzzzv",
	["<leader>m"] = "<cmd>messages<cr>",
	["<leader>q"] = "<cmd>copen<cr>",
	["c-j"] = "<cmd>cnext<cr>",
	["c-k"] = "<cmd>cprev<cr>",
	["<s-y>"] = { rhs = '"+y', modes = { "n", "v" } },
	["<s-p>"] = { rhs = '"+p', modes = { "n", "v" } },
}

for key, map in pairs(keymaps) do
	if type(map) == "string" then
		vim.schedule(function()
			vim.keymap.set("n", key, map)
		end)
	else
		vim.schedule(function()
			vim.keymap.set(map.modes or "n", key, map.rhs, map.opts)
		end)
	end
end

-- vim: ts=2 sts=2 sw=2 et
