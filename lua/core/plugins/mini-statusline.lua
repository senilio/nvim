return {
  "echasnovski/mini.statusline",
  enabled = true,
  version = false,
  config = function()
    require("mini.statusline").setup({
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local spell = vim.wo.spell and (MiniStatusline.is_truncated(120) and "S" or "SPELL") or ""
          local wrap = vim.wo.wrap and (MiniStatusline.is_truncated(120) and "W" or "WRAP") or ""
          local git = MiniStatusline.section_git({ trunc_width = 75 })
          -- Default diagnstics icon has some problems displaying in Kitty terminal
          local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          local filename = MiniStatusline.section_filename({ trunc_width = 140 })
          local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local searchcount = MiniStatusline.section_searchcount({ trunc_width = 10 })
          local location = MiniStatusline.section_location({ trunc_width = 500 })

          -- Usage of `MiniStatusline.combine_groups()` ensures highlighting and
          -- correct padding with spaces between groups (accounts for 'missing'
          -- sections, etc.)
          return MiniStatusline.combine_groups({
            { hl = mode_hl, strings = { mode, spell } },
            { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
            "%<", -- Mark general truncate point
            { hl = "MiniStatuslineFilename", strings = { filename } },
            "%=", -- End left alignment
            { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
            { hl = mode_hl, strings = { location, searchcount } },
          })
        end,
      },
    })
  end,
}
