-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading plugins so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap zpack.nvim via native vim.pack.
vim.pack.add({ "https://github.com/zuqini/zpack.nvim" }, { confirm = false })

-- Setup zpack.nvim
require("zpack").setup({
  spec = {
    -- import your plugins
    { import = "core.plugins" },
  },
  defaults = {
    confirm = true,
    lazy = true,
  },
  cmd_name = "ZPack",
})
