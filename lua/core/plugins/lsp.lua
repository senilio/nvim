local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "onsails/lspkind-nvim",
    "famiu/bufdelete.nvim",
  },
  config = function()
    -- require("lspconfig").terraformls.setup({})
  end,
}

return M
