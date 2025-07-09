return {
	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
	init_options = {
		buildDirectory = "build",
	},
}

-- vim: ts=2 sts=2 sw=2 et
