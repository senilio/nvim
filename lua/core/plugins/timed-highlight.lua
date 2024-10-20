local function timed_highlight_config()
  require("timed-highlight").setup({
    highlight_timeout_ms = 2000,
  })
end

return {
  "sahlte/timed-highlight.nvim",
  config = timed_highlight_config,
}
