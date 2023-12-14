local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }

--Custom mappings
map("v", "Y", '"*y', { silent = false }) -- YANK visual block to system clipboard
map("n", "YY", '"*yy', { silent = false }) -- YANK line to system clipboard

map("n", "<leader>1", "<cmd>b1<cr>", { silent = false })
map("n", "<leader>2", "<cmd>b2<cr>", { silent = false })
map("n", "<leader>3", "<cmd>b3<cr>", { silent = false })
map("n", "<leader>4", "<cmd>b4<cr>", { silent = false })
map("n", "<leader>5", "<cmd>b5<cr>", { silent = false })
map("n", "<leader>6", "<cmd>b6<cr>", { silent = false })
map("n", "<leader><Right>", "<cmd>bnext<cr>", { silent = false })
map("n", "<leader><Left>", "<cmd>bprev<cr>", { silent = false })
