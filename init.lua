-- Leader must be set before lazy.nvim loads plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- References to ./lua/
require("core.lazy")
require("core.mappings")
require("core.options")
require("core.autocmd")
