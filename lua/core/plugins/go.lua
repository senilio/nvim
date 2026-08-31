return {
  "ray-x/go.nvim",
  ft = { "go" },
  config = function()
    require("go").setup({
      lsp_cfg = false,
      dap_debug = false,
      dap_debug_gui = false,
      dap_debug_keymap = false,
      dap_debug_vt = false,
    })
  end,
}
