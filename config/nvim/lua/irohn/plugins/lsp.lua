return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"b0o/SchemaStore.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
				},
			},
		},
		opts = {
			servers = {
				lua_ls = {},
				nixd = {},
				bashls = {},
				pyright = {},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local keymaps = {
						["gd"] = vim.lsp.buf.definition,
						["gr"] = vim.lsp.buf.references,
						["gI"] = vim.lsp.buf.implementation,
						["gT"] = vim.lsp.buf.type_definition,
						["gD"] = vim.lsp.buf.declaration,
						["<leader>rn"] = vim.lsp.buf.rename,
						["<leader>ca"] = vim.lsp.buf.code_action,
					}

					for key, map in pairs(keymaps) do
						vim.keymap.set("n", key, map, { buffer = ev.buf })
					end

					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					if client and client.name == "yamlls" then
						client.config.settings.yaml.schemas = require("schemastore").yaml.schemas()
					end

					if client and client.supports_method("textDocument/documentHighlight") then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = ev.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = ev.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(ev2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = ev2.buf })
							end,
						})

						if client.supports_method("textDocument/inlayHint") then
							vim.keymap.set("n", "<leader>ih", function()
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }))
							end)
						end
					end
				end,
			})

			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities()
				lspconfig[server].setup(config)
			end
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
