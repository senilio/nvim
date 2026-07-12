return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    local set_indent_hl = function()
      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#444444" })
      vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#444444" })
    end

    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_indent_hl })
    set_indent_hl()
  end,
  opts = {
    bigfile = { enabled = true },
    git = { enabled = true },
    indent = {
      indent = {
        enabled = false,
        char = "│",
        only_scope = true,
        only_current = true,
        hl = "SnacksIndent",
      },
      animate = { enabled = false },
      scope = {
        enabled = true,
        char = "│",
        only_current = true,
        hl = "SnacksIndentScope",
      },
      filter = function(buf)
        return vim.g.snacks_indent ~= false
          and vim.b[buf].snacks_indent ~= false
          and vim.bo[buf].buftype == ""
          and not vim.tbl_contains(
            { "alpha", "checkhealth", "dashboard", "help", "lazy", "mason", "Trouble" },
            vim.bo[buf].filetype
          )
      end,
    },
    notifier = {
      enabled = false,
      timeout = 1000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = false },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    terminal = { enabled = true },
  },
}
