return {
  "nat-418/boole.nvim",
  keys = {
    { "<M-Up>" },
    { "<M-Down>" },
  },
  config = function()
    require("boole").setup({
      mappings = {
        increment = "<M-Up>",
        decrement = "<M-Down>",
      },
      -- User defined loops
      additions = {},
      allow_caps_additions = {
        { "enable", "disable" },
        { "up", "down" },
        { "left", "right" },
      },
    })
  end,
}
