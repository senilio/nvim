local M = {
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
      keymap = {
        preset = "enter",
      },
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "mono",
      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer" },
        },
      },
      servers = { "tflint" },
    },
    opts_extend = { "sources.completion.enabled_providers" },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers or {}) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}

return M
