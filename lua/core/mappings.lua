local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }

--Custom mappings
map("v", "Y", '"*ygv', { silent = false }) -- YANK visual block to system clipboard
map("n", "YY", '"*yygv', { silent = false }) -- YANK line to system clipboard
map("n", "XX", '"_dd', { silent = false }) -- Cut line to blackhole
map("v", "X", '"_d', { silent = false }) -- Cut block to blackhole

map("v", "p", '""p:let @"=@0<CR>', { silent = false }) -- Make paste in visual mode not yank old selection

map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { silent = false })
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { silent = false })
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { silent = false })
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { silent = false })
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { silent = false })
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { silent = false })
map("n", "<leader><Right>", "<cmd>BufferLineCycleNext<cr>", { silent = false })
map("n", "<leader><Left>", "<cmd>BufferLineCyclePrev<cr>", { silent = false })

map("n", "<leader>d", "<cmd>lua Snacks.bufdelete()<CR>")
map("n", "<leader>bd", "<cmd>lua Snacks.bufdelete()<CR>")
map("n", "<leader>bn", "<cmd>tabnew<CR>")

map("v", "sa", "<esc><cmd>Sort<cr>", { silent = true })
map("v", "sd", "<esc><cmd>Sort!<cr>", { silent = true })

map("v", "<", "<gv", { silent = false })
map("v", ">", ">gv", { silent = false })
