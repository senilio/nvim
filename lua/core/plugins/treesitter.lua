return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  opts = {
    indent = { enable = true },
    highlight = { enable = true },
    folds = { enable = true },
    endwise = { enable = true },
    ensure_installed = {
      "bash",
      "cmake",
      "css",
      "dockerfile",
      "fish",
      "go",
      "hcl",
      "html",
      "java",
      "javascript",
      "json",
      "kotlin",
      "latex",
      "ledger",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "templ",
      "terraform",
      "toml",
      "vim",
      "yaml",
    },
  },
  dependencies = {
    "RRethy/nvim-treesitter-endwise", -- mainly for Lua 'closing end' insertion
    { "nvim-mini/mini.ai", event = { "BufReadPre", "BufNewFile" }, opts = {} }, -- for q (quotes), b (brackets), t (tags)
  },
  config = function(_, opts)
    local ts = require("nvim-treesitter")

    for _, parser in ipairs(opts.ensure_installed) do
      pcall(ts.install, parser)
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
