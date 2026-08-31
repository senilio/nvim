vim.opt_local.wrap = true
vim.opt_local.expandtab = false

local function set_url_hl()
  vim.api.nvim_set_hl(0, "MarkdownUrl", { fg = "DodgerBlue" })
end

set_url_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("MarkdownUrlHighlight", { clear = true }),
  callback = set_url_hl,
})

vim.cmd([[syntax match MarkdownUrl /http[s]\?:\/\/[[:alnum:]%\/_#.-]*/]])
