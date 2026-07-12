return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  opts = {},
  keys = {
    {
      "<leader>tC",
      function()
        require("nvim-highlight-colors").toggle()
      end,
      desc = "Toggle highlight-colors",
    },
  },
}
