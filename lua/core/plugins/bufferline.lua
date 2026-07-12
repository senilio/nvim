return {
  "akinsho/nvim-bufferline.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  enabled = true,
  event = "BufReadPre",
  config = function()
    require("bufferline").setup({
      highlights = {
        background = {
          fg = "#777777",
          bg = "#000000",
        },
        buffer_selected = {
          fg = "#eeeeee",
          bg = "#1b1b1b",
        },
        indicator_selected = {
          bg = "#1b1b1b",
        },
        fill = {
          bg = "#000000",
        },
      },
      options = {
        indicator = { icon = "", style = "none" },
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        -- buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        truncate_names = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 8, -- prefix used when a buffer is de-duplicated
        show_duplicate_prefix = false,
        tab_size = 1,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = { "", "" },
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        sort_by = "id",
      },
    })
  end,
  -- vim.cmd("highlight GhBlue ctermfg=75 guifg=#6bb7fa")
}
