local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local nls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    nls.setup({
      sources = {
        nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
        nls.builtins.formatting.prettier.with({
          extra_args = { "--single-quote", "false" },
        }),
        -- nls.builtins.formatting.terraform_fmt,
        nls.builtins.formatting.black,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
        nls.builtins.code_actions.gitsigns,
        nls.builtins.formatting.shfmt,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.terraform_validate,
        nls.builtins.formatting.terraform_fmt,
      },
      on_attach = function(client, bufnr)
        vim.keymap.set(
          "n",
          "<leader>tF",
          "<cmd>lua require('core.plugins.lsp.utils').toggle_autoformat()<cr>",
          { desc = "Toggle format on save" }
        )
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}

return M
