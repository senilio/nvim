local M = {
  "ray-x/go.nvim",
  ft = { "go" },
  config = function()
    require("go").setup({})
  end,
}

return M
