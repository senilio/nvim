local function timed_highlight_config()
  require("timed-highlight").setup({
    highlight_timeout_ms = 2000,
  })
end

return {
  "senilio/timed-highlight.nvim",
  -- "sahlte/timed-highlight.nvim", -- until fix is merged
  config = timed_highlight_config,
}
