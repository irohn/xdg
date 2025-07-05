vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
          '${3rd}/busted/library',
          vim.fn.stdpath 'data' .. '/lazy',
        }
      }
    })
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "Snacks"
        }
      }
    }
  }
})

vim.lsp.enable({
  "lua_ls",
  "pyright",
  "gopls",
  "nixd",
  "clangd",
})

-- vim: ts=2 sts=2 sw=2 et
