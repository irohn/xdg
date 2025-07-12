local nix = require("nix")

local conform_setup = { formatters = {}, formatters_by_ft = {} }
local enabled_servers = {}

local function find_nix_path(bin)
	local package_info = nix.package_info(bin)
	if package_info then
		if package_info.binaries and #package_info.binaries == 1 then
			return package_info.binaries[1]
		else
			local cmd = { "fd", "--type", "f", "--glob", bin, package_info.dir }
			local result = vim.system(cmd, { text = true }):wait()
			if result.code == 0 and result.stdout and result.stdout ~= "" then
				local paths = vim.split(vim.trim(result.stdout), "\n")
				if #paths > 0 then
					return paths[1]
				end
			end
			-- Fallback to find
			cmd = { "find", package_info.dir, "-type", "f", "-name", bin }
			result = vim.system(cmd, { text = true }):wait()
			if result.code == 0 and result.stdout and result.stdout ~= "" then
				local paths = vim.split(vim.trim(result.stdout), "\n")
				if #paths > 0 then
					return paths[1]
				end
			end
			return package_info.dir .. "/result/bin/" .. bin
		end
	end
	return bin
end

local filetypes = {
	lua = {
		language_server = {
			lua_ls = {
				bin = "lua-language-server",
				config = {
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if
								path ~= vim.fn.stdpath("config")
								and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
							then
								return
							end
						end

						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								version = "LuaJIT",
								path = {
									"lua/?.lua",
									"lua/?/init.lua",
								},
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
									"${3rd}/luv/library",
									"${3rd}/busted/library",
									vim.fn.stdpath("data") .. "/lazy",
								},
							},
						})
					end,
					settings = {
						Lua = {},
					},
				},
			},
		},
		formatters = {
			stylua = {
				command = "stylua",
			},
		},
	},
	python = {
		language_server = {
			basedpyright = {
				bin = "basedpyright",
			},
		},
		formatters = {
			black = {
				command = "black",
			},
			ruff = {
				command = "ruff",
			},
		},
	},
	nix = {
		language_server = {
			nixd = {
				bin = "nixd",
			},
		},
		formatters = {
			nixfmt_rfc_style = {
				command = "nixfmt",
			},
		},
	},
	sh = {
		language_server = {
			bashls = {
				bin = "bash-language-server",
			},
		},
		formatters = {
			shfmt = {
				command = "shfmt",
			},
		},
	},
	json = {
		formatters = {
			jq = {
				command = "jq",
			},
		},
	},
	yaml = {
		language_server = {
			yamlls = {
				bin = "yaml-language-server",
				config = {
					settings = {
						yaml = {
							schemas = {
								["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json"] = ".github/workflows/*",
								["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/kustomization.json"] = "kustomization.yaml",
								["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/prettierrc.json"] = ".prettierrc",
							},
						},
					},
				},
			},
		},
		formatters = {
			yamlfmt = {
				command = "yamlfmt",
			},
		},
	},
	markdown = {
		formatters = {
			prettier = {
				command = "prettier",
			},
		},
	},
	html = {
		formatters = {
			prettier = {
				command = "prettier",
			},
		},
	},
	css = {
		formatters = {
			prettier = {
				command = "prettier",
			},
		},
	},
	javascript = {
		formatters = {
			prettier = {
				command = "prettier",
			},
		},
	},
}

for ft in pairs(filetypes) do
	if filetypes[ft].language_server then
		for server, opts in pairs(filetypes[ft].language_server) do
			local bin = find_nix_path(opts.bin or server)
			local config = opts.config or {}
			config["cmd"] = { bin }
			vim.lsp.config(server, config)
			table.insert(enabled_servers, server)
		end
	end

	-- conform
	if filetypes[ft].formatters then
		conform_setup.formatters_by_ft[ft] = vim.tbl_keys(filetypes[ft].formatters)
	end

	for formatter, config in pairs(filetypes[ft].formatters or {}) do
		local bin = find_nix_path(config.bin or formatter)
		local cmd = { bin }
		conform_setup.formatters[formatter] = { command = cmd[1] }
	end
end

vim.lsp.enable(enabled_servers)
require("conform").setup(conform_setup)

-- vim: ts=2 sts=2 sw=2 et
