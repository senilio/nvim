local M = {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local nls = require("null-ls")
		nls.setup({
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.diagnostics.eslint,
				nls.builtins.completion.spell,
				nls.builtins.formatting.prettier.with({
					extra_args = { "--single-quote", "false" },
				}),
				nls.builtins.formatting.terraform_fmt,
				nls.builtins.formatting.black,
			},
			on_attach = function(client)
				if client.server_capabilities.documentFormattingProvider then
					-- auto format on save (not asynchronous)
					local LspFormattingGrp = vim.api.nvim_create_augroup("LspFormattingGrp", { clear = true })
					vim.api.nvim_create_autocmd("BufWritePre", {
						command = "lua vim.lsp.buf.format()",
						group = LspFormattingGrp,
					})
				end
			end,
		})
	end,
}

return M