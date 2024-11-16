local M = {
  "folke/which-key.nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("which-key").setup({
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      -- operators = { gc = "Comments" },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 2, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
      show_help = true, -- show help message on the command line when the popup is visible
    })

    local wk = require("which-key")
    default_options = { silent = true }

    -- Register leader based mappings
    wk.add({
      { "<leader>1", hidden = true },
      { "<leader>2", hidden = true },
      { "<leader>3", hidden = true },
      { "<leader>4", hidden = true },
      { "<leader>5", hidden = true },
      { "<leader>6", hidden = true },
      { "<leader><Left>", hidden = true },
      { "<leader><Right>", hidden = true },
      { "<leader>f", group = "Files" },
      { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", desc = "Find File" },
      { "<leader>fm", "<cmd>lua MiniFiles.open()<CR>", desc = "Open mini-files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
      ------------------------------------------------
      { "<leader>g", group = "Git" },
      { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toogle Blame" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
      { "<leader>g<Enter>", "<cmd>Neogit<cr>", desc = "Open Neogit" },
      ------------------------------------------------
      { "<leader>h", group = "Harpoon" },
      { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open File 1" },
      { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open File 2" },
      { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open File 3" },
      { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open File 4" },
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file" },
      { "<leader>hu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Open Menu" },
      ------------------------------------------------
      { "<leader>l", group = "LSP" },
      { "<leader>lA", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", desc = "Add Workspace Folder" },
      { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go To Declaration" },
      { "<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Show implementations" },
      { "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Commands" },
      { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "<leader>lW", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", desc = "Remove Workspace Folder" },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go To Definition" },
      { "<leader>le", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", desc = "Format" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Connected Language Servers" },
      { "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },
      { "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line diagnostics" },
      { "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
      { "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
      { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition" },
      { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
      ------------------------------------------------
      { "<leader>m", group = "Misc" },
      { "<leader>mf", "<cmd>set eventignore=BufWritePre<cr>", desc = "Disable Auto Format" },
      { "<leader>ml", "<cmd>Lazy<cr>", desc = "Open Lazy GUI" },
      ------------------------------------------------
      { "<leader>s", group = "Search" },
      { "<leader>sC", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      {
        "<leader>sP",
        "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
        desc = "Colorscheme with Preview",
      },
      { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>sS", "<cmd>Telescope symbols<cr>", desc = "Search symbols" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
      { "<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "Text under cursor" },
      { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
      ------------------------------------------------
      { "<leader>w", group = "Window" },
      { "<leader>ws", "<c-w>x", desc = "Swap" },
      { "<leader>wq", "<cmd>:q<cr>", desc = "Close" },
      { "<leader>we", "<cmd>:split<cr>", desc = "Horizontal Split" },
      { "<leader>wt", "<c-w>t", desc = "Move to new tab" },
      { "<leader>ww", "<cmd>:vsplit<cr>", desc = "Vertical Split" },
      { "<leader>w<Left>", "<c-w>h", desc = "Win left", hidden = true },
      { "<leader>w<Right>", "<c-w>l", desc = "Win right", hidden = true },
      { "<leader>w<Up>", "<c-w>k", desc = "Win up", hidden = true },
      { "<leader>w<Down>", "<c-w>j", desc = "Win down", hidden = true },
    })
  end,
}

return M
