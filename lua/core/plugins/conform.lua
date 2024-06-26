local M = {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile", "InsertLeave" },
  -- disable_autoformat = false,
  config = function()
    require("conform").setup({
      formatters = {
        prettier = { extra_args = { "--single-quote", "false" } },
        shfmt = { prepend_args = { "-i", "0" } },
      },
      formatters_by_ft = {
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
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    })
  end,
}

return M
