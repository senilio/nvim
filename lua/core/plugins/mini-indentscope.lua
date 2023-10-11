local M = {
  "echasnovski/mini.indentscope",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "alpha", "checkhealth", "dashboard", "help", "lazy", "mason", "neo-tree", "Trouble" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  opts = function()
    return {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
        delay = 100,
      },
      options = { try_as_border = true },
      symbol = "│",
    }
  end,
}

return M
