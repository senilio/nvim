local M = {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufWritePre" },
  -- disable_autoformat = false,
  keys = {
    { "<leader>mf", "<cmd>FormatToggle<cr>", desc = "Toggle format-on-save" },
  },
  config = function()
    require("conform").setup({
      formatters = {
        prettier = { prepend_args = { "--single-quote", "false", "--print-width", "120" } },
        shfmt = { prepend_args = { "-i", "0" } },
        stylua = {
          inherit = false,
          command = "stylua",
          args = { "--search-parent-directories", "--stdin-filepath", "$FILENAME", "-" },
        },
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
vim.api.nvim_create_user_command("FormatToggle", function(_)
  local fmt
  if vim.g.disable_autoformat then
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
    fmt = "enabled"
  else
    vim.b.disable_autoformat = true
    vim.g.disable_autoformat = true
    fmt = "disabled"
  end
  vim.notify("Format-on-save " .. fmt)
end, {
  desc = "Toggle autoformat-on-save",
})

return M
