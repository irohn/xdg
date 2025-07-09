vim.filetype.add({
	extension = {
		jinja = "jinja",
		jinja2 = "jinja",
		j2 = "jinja",
	},
})

return {
	name = "jinja_lsp",
	cmd = { "jinja-lsp" },
	filetypes = { "jinja" },
	root_markers = { ".git" },
}

-- vim: ts=2 sts=2 sw=2 et
