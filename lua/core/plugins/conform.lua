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
      format_after_save = {
        lsp_fallback = true,
      },
      notify_on_error = true,
    })
  end,
}

return M
