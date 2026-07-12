return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = function()
    local parsers = {
      "bash",
      "cmake",
      "dockerfile",
      "fish",
      "go",
      "hcl",
      "html",
      "java",
      "javascript",
      "json",
      "latex",
      "lua",
      "python",
      "regex",
      "toml",
      "terraform",
      "yaml",
      "markdown",
      "markdown_inline",
      "vim",
    }
    local treesitter = require("nvim-treesitter")
    treesitter.install(parsers)
    treesitter.update(parsers)
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    {
      "windwp/nvim-ts-autotag",
      opts = {},
    },
  },
  config = function()
    -- v1 API: setup only accepts install_dir
    require("nvim-treesitter").setup()

    -- Enable treesitter highlighting per filetype (v1: not auto-enabled)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    pcall(vim.treesitter.start)
  end,
}
