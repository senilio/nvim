return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- install_root_dir = path.concat({ vim.fn.stdpath("data"), "mason" }),
    require("mason").setup()

    -- install LSPs, but only enable servers configured in lsp.lua
    require("mason-lspconfig").setup({
      automatic_enable = false,
    })
  end,
}
