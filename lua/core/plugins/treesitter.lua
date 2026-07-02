local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- v1 API: setup only accepts install_dir
    require("nvim-treesitter").setup()

    -- Install parsers (async, no-op if already installed)
    require("nvim-treesitter").install({
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
    })

    -- Enable treesitter highlighting per filetype (v1: not auto-enabled)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}

return M
