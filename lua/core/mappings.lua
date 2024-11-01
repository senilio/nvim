local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }

--Custom mappings
map("v", "Y", '"*ygv', { silent = false }) -- YANK visual block to system clipboard
map("n", "YY", '"*yygv', { silent = false }) -- YANK line to system clipboard
map("n", "XX", '"_dd', { silent = false }) -- Cut line to blackhole
map("v", "X", '"_d', { silent = false }) -- Cut block to blackhole

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
map("n", "<leader><Up>", "<c-w>k", { silent = false })
map("n", "<leader><Down>", "<c-w>j", { silent = false })

map("n", "<leader>d", "<cmd>lua require('bufdelete').bufdelete(0)<CR>")
map("n", "<leader>bd", "<cmd>lua require('bufdelete').bufdelete(0)<CR>")
map("n", "<leader>bn", "<cmd>tabnew<CR>")

map("n", "sa", "<cmd>Sort<cr>", { silent = true })
map("v", "sa", "<esc><cmd>Sort<cr>", { silent = true })
map("n", "sd", "<cmd>Sort!<cr>", { silent = true })
map("v", "sd", "<esc><cmd>Sort!<cr>", { silent = true })

map("v", "<", "<gv", { silent = false })
map("v", ">", ">gv", { silent = false })
