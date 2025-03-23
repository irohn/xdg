return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = false,
      component_separators = { left = "", right = ""},
      section_separators = { left = "", right = ""},
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {},
      lualine_c = {"filename"},
      lualine_x = {"encoding", "fileformat", "filetype", "location"},
      lualine_y = {},
      lualine_z = {}
    },
  },
}
