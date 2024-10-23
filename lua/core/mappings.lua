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

map("n", "<leader>w<Left>", "<c-w>h", { silent = false })
map("n", "<leader>w<Right>", "<c-w>l", { silent = false })
map("n", "<leader>w<Up>", "<c-w>k", { silent = false })
map("n", "<leader>w<Down>", "<c-w>j", { silent = false })

map("n", "<leader>d", "<cmd>Bdelete<CR>")
map("n", "<leader>bd", "<cmd>Bdelete<CR>")
map("n", "<leader>bn", "<cmd>tabnew<CR>")
