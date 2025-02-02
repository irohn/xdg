local function git_branch()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  if string.len(branch) > 0 then
    return branch
  else
    return ""
  end
end

local function statusline()
  local mode = " %{mode()} "
  local branch = " " .. git_branch()
  local set_color_1 = "%#PmenuSel#"
  local set_color_2 = "%#LineNr#"
  local file_name = " %f"
  local modified = "%m"
  local align_right = "%="
  local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
  local fileformat = " [%{&fileformat}]"
  local filetype = " %y"
  local percentage = " %p%%"
  local linecol = " %l:%c"

  return
      set_color_1 ..
      mode ..
      set_color_2 ..
      file_name ..
      modified ..
      align_right ..
      branch ..
      filetype ..
      fileencoding ..
      fileformat ..
      percentage ..
      linecol ..
      " "
end

local options = {
  number = true,
  relativenumber = true,

  -- preview substitutions
  inccommand = "split",

  -- search options
  smartcase = true,
  ignorecase = true,

  -- split options
  splitbelow = true,
  splitright = true,

  -- change tabs into spaces on save
  expandtab = true,

  -- highlight line cursor is on
  cursorline = true,

  -- persistent undo
  undofile = true,

  -- allow virtual visualization in block mode
  virtualedit = "block",

  -- show a single status line
  laststatus = 3,

  -- update times and timeouts
  updatetime = 250,
  timeoutlen = 500,

  -- wrap long lines at words
  wrap = false,
  linebreak = true,

  -- enable mouse mode
  mouse = "a",

  -- keep signcolumn on by default
  signcolumn = "yes",

  -- completion
  completeopt = "menuone,noselect,noinsert",
  pumheight = 15,

  -- statusline
  statusline = statusline(),
  showmode = false,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- vim: ts=2 sts=2 sw=2 et
