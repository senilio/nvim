return {
  "folke/zen-mode.nvim",
  enabled = true,
  dependencies = {
    "folke/twilight.nvim",
  },
  keys = {
    {
      "<leader>z",
      "<cmd>ZenMode<cr>",
      desc = "Toggle ZenMode",
    },
  },
  opts = {
    window = {
      backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 0.70, -- width of the Zen window
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
      },
    },
    on_open = function()
      vim.b.zen_mode_conceallevel = vim.opt_local.conceallevel:get()
      vim.b.zen_mode_concealcursor = vim.opt_local.concealcursor:get()
      vim.opt_local.conceallevel = 3
      vim.opt_local.concealcursor = "nc"
    end,
    on_close = function()
      vim.opt_local.conceallevel = vim.b.zen_mode_conceallevel or 0
      vim.opt_local.concealcursor = vim.b.zen_mode_concealcursor or ""
      vim.b.zen_mode_conceallevel = nil
      vim.b.zen_mode_concealcursor = nil
    end,
  },
}
