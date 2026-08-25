vim.opt_local.wrap = true
vim.opt_local.expandtab = false

-- match and highlight hyperlinks (guard against duplicate matches on ftplugin re-run)
if not vim.w.markdown_url_match then
  vim.fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
  vim.w.markdown_url_match = true
end
vim.cmd("hi matchURL guifg=DodgerBlue")
