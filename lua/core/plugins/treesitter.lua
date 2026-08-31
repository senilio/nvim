return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    -- v1 API: setup only accepts install_dir
    require("nvim-treesitter").setup()

    -- Enable treesitter highlighting per filetype (v1: not auto-enabled)
    -- Do not call vim.treesitter.start() eagerly here: on cmdline-arg
    -- buffers it forces a premature :edit before filetype detection has
    -- run, which corrupts filetype for those buffers for the rest of the
    -- session (breaks bufferline buffer-count logic and format-on-save).
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
