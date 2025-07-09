local cmd = "basedpyright-langserver"

-- If the language server is not installed, use nix.nvim to install it.
if vim.fn.executable(cmd) ~= 1 then
	local ok, nix = pcall(require, "nix")
	if ok then
		local package = nix.package("basedpyright")
		if package then
			cmd = package.dir .. "/result/bin/basedpyright-langserver"
		end
	end
end

local function set_python_path(path)
	local clients = vim.lsp.get_clients({
		bufnr = vim.api.nvim_get_current_buf(),
		name = "basedpyright",
	})
	for _, client in ipairs(clients) do
		if client.settings then
			client.settings.python = vim.tbl_deep_extend("force", client.settings.python or {}, { pythonPath = path })
		else
			client.config.settings =
				vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
		end
		client.notify("workspace/didChangeConfiguration", { settings = nil })
	end
end

return {
	cmd = { cmd, "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightOrganizeImports", function()
			client:exec_cmd({
				command = "basedpyright.organizeimports",
				arguments = { vim.uri_from_bufnr(bufnr) },
			})
		end, {
			desc = "Organize Imports",
		})

		vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", set_python_path, {
			desc = "Reconfigure basedpyright with the provided python path",
			nargs = 1,
			complete = "file",
		})
	end,
}

-- vim: ts=2 sts=2 sw=2 et
