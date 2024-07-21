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
      triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
    })

    local wk = require("which-key")
    default_options = { silent = true }

    -- register non leader based mappings
    wk.add({
      { "ga", "<Plug>(EasyAlign)", desc = "Align", mode = "x" },
      { "sF", desc = "Find left surrounding" },
      { "sa", desc = "Add surrounding" },
      { "sd", desc = "Delete surrounding" },
      { "sf", desc = "Replace right surrounding" },
      { "sh", desc = "Highlight surrounding" },
      { "sr", desc = "Replace surrounding" },
      { "ss", "<Plug>Lightspeed_s", desc = "Search 2-character forward" },
      { "st", "<cmd>lua require('tsht').nodes()<cr>", desc = "TS hint textobject" },
    })

    -- Register all leader based mappings
    wk.add({
      { "<leader>1", hidden = true },
      { "<leader>2", hidden = true },
      { "<leader>3", hidden = true },
      { "<leader>4", hidden = true },
      { "<leader>5", hidden = true },
      { "<leader>6", hidden = true },
      { "<leader><Left>", hidden = true },
      { "<leader><Right>", hidden = true },
      { "<leader><Tab>", "<cmd>bnext<cr>", desc = "Cycle buffers" },
      { "<leader>b", group = "Buffers" },
      {
        "<leader>bb",
        "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
        desc = "Find buffer",
      },
      { "<leader>bd", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
      { "<leader>f", group = "Files" },
      { "<leader>fT", "<cmd>NvimTreeFindFile<CR>", desc = "Find in Tree" },
      { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", desc = "Find File" },
      { "<leader>fm", "<cmd>lua MiniFiles.open()<CR>", desc = "Open mini-files" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
      { "<leader>fz", "<cmd>Telescope zoxide list<CR>", desc = "Zoxide" },
      { "<leader>g", group = "Git" },
      { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
      { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toogle Blame" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
      { "<leader>gg", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
      { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
      { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Open Neogit" },
      { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
      { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
      { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
      { "<leader>gt", desc = "Open Gitui" },
      { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open File 1" },
      { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open File 2" },
      { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open File 3" },
      { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Open File 4" },
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file" },
      { "<leader>hu", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Open Menu" },
      { "<leader>l", group = "LSP" },
      { "<leader>lA", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", desc = "Add Workspace Folder" },
      { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go To Declaration" },
      { "<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Show implementations" },
      { "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Commands" },
      {
        "<leader>lL",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        desc = "List Workspace Folders",
      },
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
      { "<leader>m", group = "Misc" },
      {
        "<leader>ma",
        "<cmd>lua require'telegraph'.telegraph({cmd='gitui', how='tmux_popup'})<cr>",
        desc = "Test Telegraph",
      },
      { "<leader>mf", "<cmd>set eventignore=BufWritePre<cr>", desc = "Disable Auto Format" },
      { "<leader>ml", "<cmd>Lazy<cr>", desc = "Open Lazy GUI" },
      { "<leader>ms", "<cmd>SymbolsOutline<cr>", desc = "Toggle SymbolsOutline" },
      { "<leader>mt", "<cmd>FloatermNew --autoclose=2<cr>", desc = "New Floaterm" },
      { "<leader>mz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
      { "<leader>s", group = "Search" },
      { "<leader>sC", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
      { "<leader>sH", "<cmd>Telescope heading<cr>", desc = "Find Header" },
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
      { "<leader>w", group = "Window" },
      { "<leader>w=", "<c-w>=", desc = "Equally size" },
      { "<leader>wp", "<c-w>x", desc = "Swap" },
      { "<leader>wq", "<cmd>:q<cr>", desc = "Close" },
      { "<leader>ws", "<cmd>:split<cr>", desc = "Horizontal Split" },
      { "<leader>wt", "<c-w>t", desc = "Move to new tab" },
      { "<leader>wv", "<cmd>:vsplit<cr>", desc = "Verstical Split" },
      { "<leader>ww", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Choose window to jump" },
    })
  end,
}

return M
