return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = "<C-n>",
    version = "*",
    opts = {},
    config = function()
      local buf_map = vim.api.nvim_buf_set_keymap

      require("toggleterm").setup({
        -- size can be a number or function which is passed the current terminal
        size = function(term)
          if term.direction == "horizontal" then
            return 20
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = "<C-n>",
        shading_factor = "1", -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
        direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float',
        autochdir = true,
      })
    end,
  },
}
