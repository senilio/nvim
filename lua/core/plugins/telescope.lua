local M = {

  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    -- Files
    { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
    { "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", desc = "Find File" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    -- Git
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit (for current file)" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
    -- LSP
    { "<leader>le", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
    -- Search
    { "<leader>sC", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sP", "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sS", "<cmd>Telescope symbols<cr>", desc = "Search symbols" },
    { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    { "<leader>ss", "<cmd>Telescope grep_string<cr>", desc = "Text under cursor" },
    { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jvgrootveld/telescope-zoxide",
    "crispgm/telescope-heading.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "ptethng/telescope-makefile",
    -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")

    telescope.setup({
      extensions = {
        file_browser = {
          theme = "ivy",
          previewer = true,
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          hidden = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        oldfiles = {
          cwd_only = true,
        },
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
        live_grep = {
          only_sort_text = true, -- grep for content and not file name/path
          mappings = {
            i = { ["<c-f>"] = require("telescope.actions").to_fuzzy_refine },
          },
        },
      },
      defaults = {
        -- file_ignore_patterns = { "node_modules", ".terraform", "%.jpg", "%.png" },
        file_ignore_patterns = {
          "%.7z",
          "%.jar",
          "%.jpeg",
          "%.jpg",
          "%.lock",
          "%.pdf",
          "%.png",
          "%.rar",
          "%.sqlite3",
          "%.svg",
          "%.tar",
          "%.tar.gz",
          "%.zip",
          ".ansible/",
          ".aws-sam",
          ".cache/",
          ".cargo/",
          ".gem/",
          ".git/",
          ".gradle/",
          ".minikube/",
          ".settings/",
          ".vscode/",
          ".terraform/",
          "__pycache__/*",
        },
        -- used for grep_string and live_grep
        vimgrep_arguments = {
          "rg",
          "--follow",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--no-ignore",
          "--hidden",
          "--trim",
        },
        mappings = {
          i = {
            -- Close on first esc instead of gonig to normal mode
            -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<C-k>"] = actions.move_selection_previous,
            ["<A-q>"] = actions.send_selected_to_qflist,
            ["<C-q>"] = actions.send_to_qflist,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<cr>"] = actions.select_default,
            ["<c-v>"] = actions.select_vertical,
            ["<c-s>"] = actions.select_horizontal,
            ["<c-t>"] = actions.select_tab,
            ["<c-p>"] = action_layout.toggle_preview,
            ["<c-o>"] = action_layout.toggle_mirror,
            ["<c-h>"] = actions.which_key,
          },
        },
        prompt_prefix = "> ",
        selection_caret = " ",
        entry_prefix = "  ",
        multi_icon = "<>",
        initial_mode = "insert",
        scroll_strategy = "cycle",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.75,
          height = 0.55,
          -- preview_cutoff = 120,
          prompt_position = "top",
          horizontal = {
            preview_width = function(_, cols, _)
              if cols > 200 then
                return math.floor(cols * 0.4)
              else
                return math.floor(cols * 0.6)
              end
            end,
          },
          vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
          flex = { horizontal = { preview_width = 0.9 } },
        },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      },
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("noice")
    -- telescope.load_extension("fzf")
    telescope.load_extension("zoxide")
    telescope.load_extension("heading")
  end,
}

return M
