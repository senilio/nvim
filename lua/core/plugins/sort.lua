return {
  "sQVe/sort.nvim",
  enabled = true,
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
