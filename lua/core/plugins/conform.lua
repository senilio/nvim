-- Command for toggling format on save
vim.api.nvim_create_user_command("FormatToggle", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  vim.b.disable_autoformat = nil
  local fmt = vim.g.disable_autoformat and "disabled" or "enabled"
  require("notify")("Format-on-save " .. fmt)
end, {
  desc = "Toggle autoformat-on-save",
})

return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  -- disable_autoformat = false,
  config = function()
    require("conform").setup({
      formatters = {
        prettier = { extra_args = { "--single-quote", "false" } },
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
        return { lsp_format = "fallback" }
      end,
    })
  end,
}
