local colorscheme_overwrite = nil

local function save_colorscheme(color_name)
  local cache_dir = vim.fn.stdpath('cache')
  local file = io.open(cache_dir .. '/colorscheme.txt', 'w')
  if file then
    file:write(color_name)
    file:close()
  end
end

local function load_cached_colorscheme()
  local cache_dir = vim.fn.stdpath('cache')
  local file = io.open(cache_dir .. '/colorscheme.txt', 'r')
  if file then
    local color_name = file:read()
    file:close()
    local status_ok = pcall(vim.cmd.colorscheme, color_name)
    if not status_ok then
      vim.notify('Failed to load colorscheme: ' .. color_name, vim.log.levels.WARN)
    end
  end
end

local function get_colorschemes()
  return vim.fn.getcompletion("", "color")
end

local function apply_colorscheme(colorscheme_name)
  vim.cmd.colorscheme(colorscheme_name)
end

local function pick_colorscheme(opts)
  opts = opts or {}
  local colorschemes = get_colorschemes()

  vim.ui.select(colorschemes,
    {
      prompt = "Select a colorscheme:",
      format_item = function(item)
        return item
      end,
    },
    function(selection)
      if selection then
        apply_colorscheme(selection)
        save_colorscheme(selection)
      end
    end
  )
end

vim.api.nvim_create_user_command("Theme", function()
  pick_colorscheme()
end, {})

if colorscheme_overwrite then
  vim.cmd.colorscheme(colorscheme_overwrite)
else
  load_cached_colorscheme()
end

vim.keymap.set("n", "<leader>th", "<cmd>Theme<cr>")

-- vim: ts=2 sts=2 sw=2 et
