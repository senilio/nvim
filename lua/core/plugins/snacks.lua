local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    git = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 1000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    {
      "<C-n>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
  },
}

return M
