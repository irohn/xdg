return {
	cmd = { "ansible-language-server", "--stdio" },
	settings = {
		ansible = {
			python = {
				interpreterPath = "python",
			},
			ansible = {
				path = "ansible",
			},
			executionEnvironment = {
				enabled = false,
			},
			validation = {
				enabled = true,
				lint = {
					enabled = true,
					path = "ansible-lint",
				},
			},
		},
	},
	filetypes = { "yaml.ansible" },
	root_markers = { "ansible.cfg", ".ansible-lint" },
}

-- vim: ts=2 sts=2 sw=2 et
