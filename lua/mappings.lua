local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }

--Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

--Custom mappings
map("v", "Y", '"*y', { silent = false }) -- YANK visual block to system clipboard
map("n", "YY", '"*yy', { silent = false }) -- YANK line to system clipboard
map("v", "P", '"*p', { silent = false }) -- Paste from system clipboard
