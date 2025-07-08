---@brief
---
--- https://github.com/psacawa/systemd-language-server
---
--- `systemd-language-server` can be installed via `pip`:
--- ```sh
--- pip install systemd-language-server
--- ```
---
--- Language Server for Systemd unit files
return {
	cmd = { "systemd-language-server" },
	filetypes = { "systemd" },
	root_markers = { ".git" },
}

-- vim: ts=2 sts=2 sw=2 et
