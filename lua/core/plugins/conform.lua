local M = {
  "stevearc/conform.nvim",
  enabled = true,
  -- event = { "BufWritePre" },
  -- disable_autoformat = false,
  config = function()
    require("conform").setup({
      formatters = {
        prettier = { extra_args = { "--single-quote", "false" } },
        shfmt = { prepend_args = { "-i", "0" } },
      },
      formatters_by_ft = {
        fish = { "fish_indent" },
        go = { "goimports", "gofmt" },
        javascript = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "isort", "ruff_format" },
        sh = { "shfmt" },
        terraform = { "terraform_fmt" },
        tex = { "latexindent" },
        typst = { "typstfmt" },
        yaml = { "prettier" },
      },
      format_after_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { lsp_fallback = true }
      end,
    })
  end,
}

-- Command for toggling format on save
vim.api.nvim_create_user_command("FormatToggle", function(bufnr)
  if vim.g.disable_autoformat then
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
    fmt = "enabled"
  else
    vim.b.disable_autoformat = true
    vim.g.disable_autoformat = true
    fmt = "disabled"
  end
  require("notify")("Format-on-save " .. fmt)
end, {
  desc = "Toggle autoformat-on-save",
})

return M
