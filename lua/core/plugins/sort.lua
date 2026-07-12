return {
  "sQVe/sort.nvim",
  enabled = true,
  cmd = { "Sort" },
  config = function()
    require("sort").setup({
      delimiters = {
        ",",
        "|",
        ";",
        ":",
        "s", -- Space
        "t", -- Tab
      },
    })
  end,
}
