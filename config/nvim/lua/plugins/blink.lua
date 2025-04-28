return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "Kaiser-Yang/blink-cmp-avante",
    },
    version = "*",
    opts = {
      completion = { documentation = { auto_show = true } },
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "avante", "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100
          },
        },
      },
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },
}

-- vim: ts=2 sts=2 sw=2 et
