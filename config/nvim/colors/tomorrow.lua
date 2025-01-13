-- 'Tomorrow' color scheme
-- Derived from Tomorrow Theme (https://github.com/chriskempson/tomorrow-theme)
local use_cterm, palette

-- Night palette
if vim.o.background == 'dark' then
  palette = {
    base00 = '#1d1f21', -- background
    base01 = '#282a2e',
    base02 = '#373b41',
    base03 = '#969896',
    base04 = '#b4b7b4',
    base05 = '#c5c8c6', -- foreground
    base06 = '#e0e0e0',
    base07 = '#ffffff',
    base08 = '#cc6666', -- red
    base09 = '#de935f', -- orange
    base0A = '#f0c674', -- yellow
    base0B = '#b5bd68', -- green
    base0C = '#8abeb7', -- aqua/cyan
    base0D = '#81a2be', -- blue
    base0E = '#b294bb', -- purple
    base0F = '#a3685a', -- brown
  }
  use_cterm = {
    base00 = 234,
    base01 = 235,
    base02 = 237,
    base03 = 246,
    base04 = 249,
    base05 = 251,
    base06 = 254,
    base07 = 231,
    base08 = 167,
    base09 = 173,
    base0A = 222,
    base0B = 143,
    base0C = 109,
    base0D = 110,
    base0E = 139,
    base0F = 137,
  }
end

-- Day palette
if vim.o.background == 'light' then
  palette = {
    base00 = '#ffffff', -- background
    base01 = '#e0e0e0',
    base02 = '#d6d6d6',
    base03 = '#8e908c',
    base04 = '#969896',
    base05 = '#4d4d4c', -- foreground
    base06 = '#282a2e',
    base07 = '#1d1f21',
    base08 = '#c82829', -- red
    base09 = '#f5871f', -- orange
    base0A = '#eab700', -- yellow
    base0B = '#718c00', -- green
    base0C = '#3e999f', -- aqua/cyan
    base0D = '#4271ae', -- blue
    base0E = '#8959a8', -- purple
    base0F = '#a3685a', -- brown
  }
  use_cterm = {
    base00 = 231,
    base01 = 254,
    base02 = 253,
    base03 = 246,
    base04 = 246,
    base05 = 239,
    base06 = 235,
    base07 = 234,
    base08 = 160,
    base09 = 208,
    base0A = 178,
    base0B = 64,
    base0C = 73,
    base0D = 25,
    base0E = 96,
    base0F = 137,
  }
end

if palette then
  require('mini.base16').setup({ palette = palette, use_cterm = use_cterm })
  vim.g.colors_name = 'tomorrow'
end

-- vim: ts=2 sts=2 sw=2 et
