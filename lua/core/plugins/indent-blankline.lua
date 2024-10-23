local M = {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    scope = {
      enabled = true,
    },
    indent = {
      char = { "|", "¦", "┆", "┊" },
    },
    exclude = {
      filetypes = {
        "startify",
        "dashboard",
        "dotooagenda",
        "log",
        "fugitive",
        "gitcommit",
        "packer",
        "vimwiki",
        "markdown",
        "json",
        "txt",
        "vista",
        "help",
        "todoist",
        "NvimTree",
        "peekaboo",
        "git",
        "TelescopePrompt",
        "undotree",
        "flutterToolsOutline",
        "", -- for all buffers without a file type
      },
      buftypes = {
        "terminal",
        "nofile",
      },
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}

return M
