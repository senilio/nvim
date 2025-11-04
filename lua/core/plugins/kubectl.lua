return {
  {
    "ramilito/kubectl.nvim",
    -- use a release tag to download pre-built binaries
    version = "2.*",
    dependencies = "saghen/blink.download",
    config = function()
      require("kubectl").setup()
    end,
  },
}
