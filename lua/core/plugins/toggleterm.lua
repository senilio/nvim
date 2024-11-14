return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = "<C-n>",
    version = "*",
    opts = {},
    config = function()
      local buf_map = vim.api.nvim_buf_set_keymap

      require("toggleterm").setup({
        -- size can be a number or function which is passed the current terminal
        size = function(term)
          if term.direction == "horizontal" then
            return 20
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = "<C-n>",
        shading_factor = "1",
        direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float',
        start_in_insert = true,
        persist_mode = false,
        autochdir = true,
      })

      local opts = { noremap = true }

      -- Better navigation to and from terminal
      local set_terminal_keymaps = function()
        buf_map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
        buf_map(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
        buf_map(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
        buf_map(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
        buf_map(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
      end

      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          set_terminal_keymaps()
          vim.cmd([[setlocal nospell]])
        end,
        desc = "Mappings for navigation with a terminal",
      })
    end,
  },
}
