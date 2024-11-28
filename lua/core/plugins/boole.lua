local M = {
  "nat-418/boole.nvim",
  config = function()
    require("boole").setup({
      mappings = {
        increment = "<A-Up>",
        decrement = "<A-Down>",
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

return M
