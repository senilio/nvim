local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }

--Custom mappings
map("v", "Y", '"*y', { silent = false }) -- YANK visual block to system clipboard
map("n", "YY", '"*yy', { silent = false }) -- YANK line to system clipboard
map("v", "P", '"*p', { silent = false }) -- Paste from system clipboard

map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { silent = false })
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { silent = false })
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { silent = false })
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { silent = false })
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { silent = false })
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { silent = false })
map("n", "<leader><Right>", "<cmd>BufferLineCycleNext<cr>", { silent = false })
map("n", "<leader><Left>", "<cmd>BufferLineCyclePrev<cr>", { silent = false })
