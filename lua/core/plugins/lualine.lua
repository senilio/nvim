return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
  config = function()
    -- use gitsigns as source info
    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    require("lualine").setup({
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "b:gitsigns_head", icon = "" }, { "diff", soruce = diff_source } },
        lualine_b = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
          },
        },
        lualine_c = {
          {
            "filetype",
            icon_only = true, -- Display only an icon for filetype
          },
          {
            "filename",
            file_status = true, -- Displays file status (readonly status, modified status)
            path = 1, -- 0: Just the filename 1: Relative path 2: Absolute pathath
            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            symbols = { modified = " (modified)", readonly = " " },
          },
        },
        lualine_x = {
          "encoding",
          "fileformat",
          "filesize",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "toggleterm", "quickfix", "symbols-outline" },
    })
  end,
}
